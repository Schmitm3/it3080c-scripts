GitHub Repo for IT3080C
=======

# Lab 7 

This will walk through how to install and use AnyBox Module for PowerShell. 
This module allows for a message box or input box from the user while using PowerShell.

Let's install and import the module installed:

```
Install-Module -Name 'AnyBox'
Import-Module AnyBox
```

The first example will be of a popup box using AnyBox.
This will make a simple message box appear that can be modified in many different ways.

```
Show-AnyBox -Title 'MessageBoxDemo' -Message 'Hello IT3080C!' -FontSize 20 -ContentAlignment 'Center' -Buttons 'Close'
```

Next, we will look at how to create an input box for user input.
Run the following script to show how user input works.

```
Show-AnyBox -Title 'InputBoxDemo' -Prompts "Favorite Class at UC" -Buttons 'Submit'
```

You can also have multiple inputs within one box for the user to enter. See the example below.

```
Show-AnyBox -Title 'InputBoxDemo' -Prompts "Favorite Class at UC","What is your favorite food?" -Buttons 'Submit','Dont Answer'
```
After the input has been received it will be displayed on the terminal as well!
