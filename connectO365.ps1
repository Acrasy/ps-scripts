# Enable Remote-Signed scripts
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
 
# Get credentials, enter an O365-Admin's credentials here
$LiveCred = Get-Credential
 
# Creates some session
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCred -Authentication Basic -AllowRedirection
 
# This actually opens the session and imports the O365 scripts
Import-PSSession $Session