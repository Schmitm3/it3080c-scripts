#$Hello = "Hello, PowerShell!"
#Write-Host($Hello)

Function getIP
{
(Get-NetIPAddress).IPv4Address | Select-String "192*"
}

Write-Host (getIP)
$IP = getIP

Write-Host "This machines IP is $IP"
Write-Host ("This machines IP is {0}" -f $IP)

$Date = Get-Date

$Body = "This machine's IP is $IP. User is $env:username. Hostname is $env:computername. PwerShell version is $($HOST.version). Today's date is $Date"

Write-Host ($Body)

#Send-MailMessage -To "schmitm3@gmail.com" -From "schmitm3@gmail.com" -Subject "IT3080C Windows SysInfo" -Body $Body -SmtpServer smtp.google.com -Port 587 -UseSSL -Credential (Get-Credential)