# Set Execution Policy to allow running scripts (This will still run even with -WhatIf)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Install Chocolatey packages (with -WhatIf)
choco install zoom slack googlechrome protonvpn nodejs openjdk17 vscode -y -WhatIf

# Install Salesforce CLI using npm (with -WhatIf)
npm install @salesforce/cli --global -WhatIf

