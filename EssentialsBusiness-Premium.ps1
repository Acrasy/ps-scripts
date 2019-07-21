$names= @(
"alesia.emelyanova@specific-group.com"
"alexander.dovnar@specific-group.com"
"Alexander.Frolov@specific-group.com"
"Alexander.Potapovich@specific-group.com"
"Alexander.Sidorov@specific-group.com"
"alexander.ukadzer@specific-group.com"
"Alexander.Volvachev@specific-group.com"
"Alexandra.Amelishko@specific-group.com"
"Alexey.Krasnogir@specific-group.com"
"Alexey.Memelov@specific-group.com"
"Aliaksandr.Palei@specific-group.com"
"Andrey.Kozyrskiy@specific-group.com"
"Anna.Naumovich@specific-group.com"
"Anna.Shalai@specific-group.com"
"arsene.kazimirski@specific-group.com"
"Artiom.Yankovsky@specific-group.com"
"Darya.Gribovskaya@specific-group.com"
"Darya.Leanovich@specific-group.com"
"Denis.Krek@specific-group.com"
"Denis.Mikulich@specific-group.com"
"dmitrii.dobrickii@specific-group.com"
"dmitry.khadasok@specific-group.com"
"Dmitry.Ovchinnikov@specific-group.com"
"ekaterina.garbar@specific-group.com"
"ekaterina.kiklevich@specific-group.com"
"elena.litvinova@specific-group.com"
"Eugene.Olesyuk@specific-group.com"
"Friedrich.Weissenbeck@specific-group.at"
"Galina.Yurkovets@specific-group.com"
"igor.antonov@specific-group.com"
"Igor.Bondarenko@specific-group.com"
"Ilia.Zenkevich@specific-group.com"
"Irina.Shestak@specific-group.com"
"Irina.Soloviova@specific-group.com"
"Julia.Smirnova@specific-group.com"
"Klim.Izmaikov@specific-group.com"
"Kristina.Serova@specific-group.com"
"Leonid.Vorozhun@specific-group.com"
"Maksim.Aleshko@specific-group.com"
"Marco.Stubits@specific-group.com"
"Marina.Kontsevaya@specific-group.com"
"Megha.Saxena@specific-group.com"
"natalia.borikova@specific-group.com"
"natalia.krasnogir@specific-group.com"
"Nikita.Vecher@specific-group.com"
"nikolay.umanets@specific-group.com"
"olga.avdeichik@specific-group.com"
"Olga.Bayok@specific-group.com"
"Olga.Borisova@specific-group.com"
"Olga.Novikova@specific-group.com"
"olga.popkova@specific-group.com"
"Pavel.Bondar@specific-group.com"
"Pavel.Ivanov@specific-group.com"
"Pavel.Ptashyts@specific-group.com"
"Raman.Yauseyeu@specific-group.com"
"roman.nesterenko@specific-group.com"
"Siarhei.Yanusheuski@specific-group.com"
"Svetlana.Somova@specific-group.com"
"Valiantsin.Shukaila@specific-group.com"
"Veronika.Ivushkina@specific-group.com"
"Victoria.Gardukevich@specific-group.com"
"Vincent.Gruen@specific-group.com"
"Vladimir.Kalko@specific-group.com"
"Yana.Kalashnikova@specific-group.com"
"Yauheni.Barannikau@specific-group.com"
"Yulia.Chernitskaya@specific-group.com"
"Yury.Valiukevich@specific-group.com"
"Zoya.Krasnoschekova@specific-group.com"
"vadim.syrichev@specific-group.com"
"Alexey.Popov@specific-group.com"
"Vitali.Vanovich@specific-group.com"
)


$trial="licensetest@specific-group.com"
$deletemessage='removed licenses from '
$finmessage='process for complete for '


Connect-MsolService

#create logfile
Out-File C:\Users\simon\Documents\scriptlog.txt

#start of actual script
foreach($i in $newnames){
    
    Set-MsolUserLicense -UserPrincipalName $i -RemoveLicenses "specificgroup:O365_BUSINESS_ESSENTIALS", "specificgroup:O365_BUSINESS"
    Add-Content C:\Users\simon\Documents\scriptlog.txt $deletemessage+$i
    Set-MsolUserLicense -UserPrincipalName $i -AddLicenses "specificgroup:O365_BUSINESS_PREMIUM"
    Add-Content C:\Users\simon\Documents\scriptlog.txt $finmessage+$i
}
