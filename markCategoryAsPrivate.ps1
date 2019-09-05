# Outlook Connection
$Outlook = New-Object -ComObject Outlook.Application
#Connect to Outlook Calendar
$OutlookCalendar = $Outlook.session.GetDefaultFolder(9) #Value 9 for calendar entry/ value 10 for contacts

$category = Read-Host -Promt "enter category"
foreach($i in $OutlookCalendar.items){
    if($i.Categories -like   "*$category*"){              #Items contain $subject
        $i.Sensitivity=2;                               #Sensitivity=2  makes private
        $i.Save();                                      #write changes to server
    }
}