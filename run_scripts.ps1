# Set Execution Policy to allow running scripts
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Download and execute install_applications.ps1
$installScriptUrl = "https://raw.githubusercontent.com/chininchu/install-scripts/main/install_applications.ps1"  
$installScriptContent = (New-Object System.Net.WebClient).DownloadString($installScriptUrl)
Invoke-Expression $installScriptContent -WhatIf # Use -WhatIf for testing

# SSH Key Generation (Batch Script - Simulation)
echo We're now going to simulate generating an SSH public/private key pair. This key is like a fingerprint for you on your laptop. We'll use this key for connecting to GitHub without having to enter a password.

echo Please enter your name (e.g., John Doe):
$USERSNAME = Read-Host "Enter your name"

echo Please enter your GitHub email:
$GITHUBEMAIL = Read-Host "Enter your GitHub email"

while (-not ($GITHUBEMAIL -match "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")) {
    Write-Host "Invalid email format."
    $GITHUBEMAIL = Read-Host "Please enter a valid email address (e.g., name@example.com)"
}

Write-Host "Simulating Git configuration..."
# git config --global user.name "$USERSNAME"
# git config --global user.email "$GITHUBEMAIL"

Write-Host "Simulating SSH key pair generation..."
# ssh-keygen -t ed25519 -C "$USERSNAME" -f "$HOME/.ssh/id_ed25519"

Write-Host "Would normally copy public key to clipboard..."
# Get-Content "$HOME/.ssh/id_ed25519.pub" | Set-Clipboard

Write-Host "We would have copied your SSH public key to the clipboard."
Write-Host "IN A REAL RUN, you would then follow these steps:"
Write-Host "1. Open your web browser and go to: https://github.com/settings/ssh"
Write-Host "2. Click the 'New SSH key' button."
Write-Host "3. Give the key a title (e.g., MyLaptop)."
Write-Host "4. Paste your public key (which would be in your clipboard) into the 'Key' field."
Write-Host "5. Click 'Add SSH key'."

Read-Host -Prompt "Press Enter to continue..." 
