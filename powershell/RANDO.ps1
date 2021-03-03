$RANDO = 0
$logFile = "C:\Logs\Rando.log"

for ($i=0; $i -lt 5; $i++) {
    $RANDO = Get-Random -Maximum 1000 -Minimum 1
    Write-Host($RANDO)
    Add-Content $logFile -Value "INFO: Random number is ${RANDO}" 
}