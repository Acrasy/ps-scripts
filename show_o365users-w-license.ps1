# Enable Remote-Signed scripts
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
 
# Get credentials, enter an O365-Admin's credentials here
$LiveCred = Get-Credential
 
# Creates some session
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCred -Authentication Basic -AllowRedirection
 
# This actually opens the session and imports the O365 scripts
Import-PSSession $Session

#Establish a PowerShell session with Office 365. You'll be prompted for your Delegated Admin credentials

Connect-MsolService
$customers = Get-MsolPartnerContract
Write-Host "Found $($customers.Count) customers for $((Get-MsolCompanyInformation).displayname)." -ForegroundColor DarkGreen
$CSVpath = "C:\Temp\UserLicenseReport.csv"
 
foreach ($customer in $customers) {
    Write-Host "Retrieving license info for $($customer.name)" -ForegroundColor Green
    $licensedUsers = Get-MsolUser -TenantId $customer.TenantId | Where-Object {$_.islicensed}
 
    foreach ($user in $licensedUsers) {
        Write-Host "$($user.displayname)" -ForegroundColor Yellow  
        $licenses = $user.Licenses
        $licenseArray = $licenses | foreach-Object {$_.AccountSkuId}
        $licenseString = $licenseArray -join ", "
        Write-Host "$($user.displayname) has $licenseString" -ForegroundColor Blue
        $licensedSharedMailboxProperties = @{
            CustomerName      = $customer.Name
            DisplayName       = $user.DisplayName
            Licenses          = $licenseString
            TenantId          = $customer.TenantId
            UserPrincipalName = $user.UserPrincipalName
        }
        $forcsv = New-Object psobject -Property $licensedSharedMailboxProperties
        $forcsv | Select-Object CustomerName, TenantId, DisplayName, UserPrincipalName, Licenses | Export-CSV -Path $CSVpath -Append -NoTypeInformation    
    }
}