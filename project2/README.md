# What the script does
-This PowerShell script takes an imported CSV file of email addresses

-The script then separates the domain of the email into another column of an exported CSV

-The script looks for emails belonging to Gmail, Yahoo, etc. and marks those to be removed

-The script marks emails to keep as well that would be work approved emails

-The script will mark emails to keep as TRUE and those to remove as FALSE in the output file

-The script will output to the console as well while running and show a total number at the end of emails to keep and remove

# How to run
-Download GetUserDomain.ps1 and Users.csv

-You can use the users listed in the current file or add your own

-Using PowerShell, navigate to the folder both files are located in

-Run this command:
```
.\GetUserDomain.ps1 -UserFile .\Users.csv
```

# Output
-The output should be two files:
	-A transcript of the script
	-An exported file called DomainList.csv containing the new information
