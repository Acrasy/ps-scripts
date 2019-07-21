# Enable Remote-Signed Scripts
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
 
# Get Credentials, Enter An O365-Admin's Credentials Here
$LiveCred = Get-Credential
 
# Creates Some Session
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCred -Authentication Basic -AllowRedirection
 
# This actually opens the session and imports the O365 scripts
Import-PSSession $Session

# Mailbox To Copy From
$source = Read-Host "Please enter the source mailbox ( Firstname.Lastname)"

# Mailbox To Copy To
$dest = Read-Host "Please enter the dest mailbox ( Firstname.Lastname)"

# Copy from Source to destination in Folder "Attached Mailboxes"
Search-Mailbox -Identity $source -TargetMailbox $dest -TargetFolder "Attached Mailboxes" -LogLevel Basic

# Close Session Again
Remove-PSSession $Session