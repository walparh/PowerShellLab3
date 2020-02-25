<#
Purpose: 3rd powershell lab uses:
        Here-strings
        Writing and reading files
        conditional logic

Author: Parker W
file: PSLab3.ps1
date: Febuary 20, 2020

#>

cls

cd $env:USERPROFILE

Get-ChildItem -Filter *.txt | Format-Table -Property name, length

$menu = @'
    What do you want to do?
        1. Write a contact entry to a file
        2. Display all files last written to after a digevn date
        3. Read a specified text file


'@ #end here string menu

$menu

$choice = Read-Host "enter your choice"


if($choice -eq 1){
    $fullname = Read-Host "Enter your full name"
    $phonenumber = Read-Host "Enter your phone number"
    $email = Read-Host "Enter your email address"
    $filename = Read-Host "Enter the name of the file you wish to save this as"
    Add-Content -Path $filename -Value $fullname, $phonenumber, $email 
    Add-Content -Path $filename -Value " " 
}

elseif($choice -eq 2){
    $filedate = Read-Host "enter the earlies date of files to display"
    Get-ChildItem | Where-Object {$_.LastWriteTime -ge $filedate } | Format-Table -Property name, LastWriteTime
}

elseif($choice -eq 3){
    $choice3filename = Read-Host "Enter the name of a text file to view"
    
    if(Test-Path $choice3filename -PathType leaf){
        Get-Content $choice3filename
    }else{
        echo "File not found"
    }
}

else {
    echo "That was an invalid input option"
    echo $env:USERNAME
    echo $env:COMPUTERNAME
}
