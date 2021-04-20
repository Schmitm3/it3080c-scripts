### Expanding on Project 2 ###
### We have a list of emails from our company, but want to mark any email with a Gmail, Yahoo, etc. account to be removed ###
### We will send the final report to the manager's email we enter ###

param(
    [Parameter(Mandatory=$true)][string]$UserFile
)

### Creating a transcript of the PowerShell
Start-Transcript -Path ".\transcript.log"

### Getting CSV File to and User List to run
### This reolves the path of the file so we do not need to hard code
$userFilePath = resolve-path $UserFile
$userList = Import-CSV $userFilePath
$domainList = ".\DomainList.csv"

#Enter the email address of the manager to send the email to
$managerEmailAddress = Read-Host -Prompt 'Input Manager Email Address to send to'

$labels = ("Email", "Domain", "RemoveEmail") -join ","
Add-Content -Path $domainList -Value $labels -Encoding UTF8

### Variables to count and print out how many of each type of email there are
$keepEmail =0
$removeEmail =0

### Creating For Loop to cycle through each entry in the CSV file
foreach ($user in $userList)
{
    $email = $user.Email
    $domain = $email.Split("@")[1]

    Write-Host "Checking $email..."

    ### Using an If Statement to find email addresses that do not belong within the work environment
    if ($domain -eq "gmail.com" -or $domain -eq "yahoo.com" -or $domain -eq "hotmail.com")
    {
        Write-Host "$email belongs to the $domain domain, please remove!" -Foregroundcolor Red
        Write-Host ""
        $removeEmail++
        $results = ("$email", "$domain", "TRUE") -join ","
        Add-Content -Path $domainList -Value $results -Encoding UTF8
    }
    else
    {
        Write-Host "$email belongs to an approved work domain, all clear!" -Foregroundcolor Green
        Write-Host ""
        $keepEmail++
        $results = ("$email", "$domain", "FALSE") -join ","
        Add-Content -Path $domainList -Value $results -Encoding UTF8
    }
}

Write-Host ""
Write-Host ""
Write-Host "Total number of emails to keep: $keepEmail" -Foregroundcolor Green
Write-Host "Total number of emails to remove: $removeEmail" -Foregroundcolor Red
Write-Host ""
Write-Host ""

#Create Outlook email to send
#NOTE: THIS REQUIRES OUTLOOK INSTALLED ON LOCAL MACHINE RUNNING SCRIPT (I HAVE OUTLOOK INSTALLED ON MY COMPUTER AND SIGNED IN WITH UC ACOCUNT)
#http://techyguy.in/powershell-script-to-send-an-email-without-an-smtp-server/
$outlook = New-Object -ComObject Outlook.Application
$outlookDate = Get-Date -Format g
$outlookMail = $outlook.CreateItem(0)
$outlookMail.To = $managerEmailAddress
$outlookMail.Subject = "Email Report $outlookDate EST"
$outlookMail.Body = "Please review the domain report from $outlookDate that will be sent in a follow up email. Total number of emails to keep: $keepEmail / Total number of emails to remove: $removeEmail"
Try
{
    $outlookMail.Send()
    Write-Host "Mail Sent Successfully to Manager"
    Read-Host -Prompt 'Press Enter to exit'
}
Catch
{
    Write-Host "Mail not sent, please try again"
    Read-Host -Prompt 'Press Enter to exit'
}

### Stopping the Transcript
Stop-Transcript