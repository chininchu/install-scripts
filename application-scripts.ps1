
#Script

# powershell -ExecutionPolicy Bypass -Command "& { (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1') } -WhatIf" 


# Set Execution Policy to allow running scripts
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Install Chocolatey packages
choco install zoom slack googlechrome protonvpn -y 

