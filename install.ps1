
# choco install nodejs-lts --version 20.13.1 -y
# choco install git --version 2.45.1 -y
# choco install vscode --version 1.89.1 -y
# choco install openssh --version 8.0.0.1 -y
# choco install zoom --version 6.0.4.38135 -y
# choco install slack --version 4.38.125 -y
# choco install googlechrome --version 125.0.6422.76 -y
# choco install temurin17 --version 17.0.10 -y
# npm install @salesforce/cli --global

# PowerShell script for Windows setup with Chocolatey

# # Function to prompt user to continue
# function Wait-ToContinue {
#     Read-Host -Prompt 'Press Enter to continue or Ctrl-C to exit'
# }

# # Ensure Chocolatey is installed
# if (-Not (Get-Command choco -ErrorAction SilentlyContinue)) {
#     Set-ExecutionPolicy Bypass -Scope Process -Force; 
#     [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
#     iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# }

# # Install applications
# choco install googlechrome -y
# choco install temurin17 -y
# choco install maven -y
# choco install tomcat
# choco install mysql --version=8.0 -y
# choco install nodejs -y
# choco install vscode -y
# choco install git -y
# choco install openssh -y

# # Install Salesforce CLI using npm
# npm install @salesforce/cli --global

# # Prompt for user information
# $USERSNAME = Read-Host "Please enter your name (Example: Casey Edwards)"
# $GITHUBEMAIL = Read-Host "Enter your GitHub email"

# # Validate email format
# while ($GITHUBEMAIL -notmatch '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$') {
#     Write-Host "Invalid email"
#     $GITHUBEMAIL = Read-Host "Please re-enter your GitHub email"
# }

# # Configure Git
# git config --global user.name "$USERSNAME"
# git config --global user.email $GITHUBEMAIL

# # Generate SSH key
# $sshKeyPath = "$HOME\.ssh\id_ed25519"
# if (-Not (Test-Path $sshKeyPath)) {
#     ssh-keygen -t ed25519 -C "$GITHUBEMAIL" -f $sshKeyPath -N ""
#     Get-Content "$sshKeyPath.pub" | Set-Clipboard
#     Write-Host "SSH key has been generated and copied to the clipboard. Please add it to your GitHub account."
#     Start-Process "https://github.com/settings/ssh"
#     Wait-ToContinue
# }

# # Set up global gitignore
# $gitignorePath = "$HOME\.gitignore_global"
# if (-Not (Test-Path $gitignorePath)) {
#     @"
# .DS_Store
# "@ | Out-File -FilePath $gitignorePath
#     git config --global core.excludesfile $gitignorePath
# }

# # Set default git editor to VS Code
# $codePath = (Get-Command code).Source
# if ($codePath) {
#     git config --global core.editor "code --wait"
# } else {
#     Write-Host "Visual Studio Code is not installed or not found in PATH. Git editor not set."
# }

# # Validate installations
# $errors = @()
# $checkCommands = @("choco", "node", "java", "mvn", "tomcat", "mysql", "sfdx")
# foreach ($cmd in $checkCommands) {
#     if (-Not (Get-Command $cmd -ErrorAction SilentlyContinue)) {
#         $errors += "$cmd installation failed."
#     }
# }

# if ($errors.Count -eq 0) {
#     Write-Host "All services were installed successfully." -ForegroundColor Green
# } else {
#     Write-Host "Not all services were installed." -ForegroundColor Yellow
#     foreach ($error in $errors) {
#         Write-Host $error -ForegroundColor Red
#     }
# }

# Write-Host "Setup is complete! Happy Coding!" -ForegroundColor Cyan

# # End of script
















# PowerShell script for Windows setup with Chocolatey (Improved)

# ... (previous sections: Chocolatey installation, Install-IfMissing function, application installations, Salesforce CLI installation)


function Wait-ToContinue {
    Read-Host -Prompt 'Press Enter to continue or Ctrl-C to exit'
}

# Ensure Chocolatey is installed
if (-Not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; 
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Function to install a package if not already installed
function Install-IfMissing {
    param($packageName, $version = "")
    if (-Not (Get-Command $packageName -ErrorAction SilentlyContinue)) {
        choco install $packageName $version -y
    } else {
        Write-Host "$packageName is already installed." -ForegroundColor Yellow
    }
}

# Install applications (using the new function)
Install-IfMissing googlechrome
Install-IfMissing temurin17
Install-IfMissing maven
Install-IfMissing tomcat "--version=9"
Install-IfMissing mysql "--version=8.0"
Install-IfMissing nodejs
Install-IfMissing vscode
Install-IfMissing git
Install-IfMissing openssh

# Install Salesforce CLI using npm (only if not installed)
if (-Not (Get-Command sfdx -ErrorAction SilentlyContinue)) {
    npm install @salesforce/cli --global
} else {
    Write-Host "Salesforce CLI is already installed." -ForegroundColor Yellow
}





# Prompt for user information
$USERSNAME = Read-Host "Please enter your name (Example: Casey Edwards)"
$GITHUBEMAIL = Read-Host "Enter your GitHub email"

# Validate email format
while ($GITHUBEMAIL -notmatch '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$') {
    Write-Host "Invalid email"
    $GITHUBEMAIL = Read-Host "Please re-enter your GitHub email"
}

# Configure Git
git config --global user.name "$USERSNAME"
git config --global user.email $GITHUBEMAIL

# Generate SSH key
$sshKeyPath = "$HOME\.ssh\id_ed25519"
if (-Not (Test-Path $sshKeyPath)) {
    ssh-keygen -t ed25519 -C "$GITHUBEMAIL" -f $sshKeyPath -N ""
    Get-Content "$sshKeyPath.pub" | Set-Clipboard
    Write-Host "SSH key has been generated and copied to the clipboard. Please add it to your GitHub account."
    Start-Process "https://github.com/settings/ssh"
    Wait-ToContinue
}

# Set up global gitignore
$gitignorePath = "$HOME\.gitignore_global"
if (-Not (Test-Path $gitignorePath)) {
    @"
.DS_Store
"@ | Out-File -FilePath $gitignorePath
    git config --global core.excludesfile $gitignorePath
}

# Set default git editor to VS Code
$codePath = (Get-Command code).Source
if ($codePath) {
    git config --global core.editor "code --wait"
} else {
    Write-Host "Visual Studio Code is not installed or not found in PATH. Git editor not set."
}

# Validate installations (improved error handling)
$errors = @() # Initialize an array to store error messages
$checkCommands = @("choco", "node", "java", "mvn", "tomcat", "mysql", "sfdx")
foreach ($cmd in $checkCommands) {
    try {
        & $cmd --version  # Use try-catch for better error handling
    } catch {
        # Use a different variable name to avoid conflict with the built-in $error variable
        $errorMessage = $_.Exception.Message
        $errors += "$cmd not found or not working: $errorMessage" 
    }
}

if ($errors.Count -eq 0) {
    Write-Host "All services were installed successfully." -ForegroundColor Green
} else {
    Write-Host "Some services had issues:" -ForegroundColor Yellow
    foreach ($error in $errors) {
        Write-Host $error -ForegroundColor Red
    }
}

Write-Host "Setup is complete! Happy Coding!" -ForegroundColor Cyan
