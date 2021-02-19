param(
    [Parameter(Mandatory=$true)][string]$UserFile
)

###Creating a transcript of the PowerShell
Start-Transcript -Path ".\transcript.log"

###Getting CSV File to and User List to run
###This reolves the path of the file so we do not need to hard code
$userFilePath = resolve-path $UserFile
$userList = Import-CSV $userFilePath
$domainList = ".\DomainList.csv"
$labels = ("Email", "Domain") -join ","
Add-Content -Path $domainList -Value $labels -Encoding UTF8

###Creating For Loop to cycle through each entry in teh CSV file
foreach ($user in $userList)
{
    $email = $user.Email

    $domain = $email.Split("@")[1]
    $results = ("$email", "$domain") -join ","
    Add-Content -Path $domainList -Value $results -Encoding UTF8
}

###Stopping the Transcript
Stop-Transcript