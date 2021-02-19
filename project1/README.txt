###What the script does
-This PowerShell script takes an imported CSV file of user emails.
-The script then separates the domain of the email into another column of an exported CSV.

###How to run
-Download GetUserDomain.ps1 and Users.csv
-You can use the users listed in the current file or add your own
-Using PowerShell, navigate to the folder both files are located in
-Run this command: .\GetUserDomain.ps1 -UserFile .\Users.csv

###Output
-The output should be two files:
	-A transcript of the script
	-An exported file called DomainList.csv containing the new information.
