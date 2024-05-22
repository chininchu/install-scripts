# function Install-ChocolateyPackage {
#     param (
#       [Parameter(Mandatory, Position=0)]
#       [string]$PackageName,
  
#       [string]$Source,
  
#       [alias("Params")]
#       [string]$PackageParameters,
  
#       [string]$Version,
  
#       [alias("Pre")]
#       [switch]$Prerelease,
  
#       [switch]$UseInstallNotUpgrade
#     )
  
#     $chocoExecutionArgs = "choco.exe"
#     if ($UseInstallNotUpgrade) {
#       $chocoExecutionArgs += " install"
#     } else {
#       $chocoExecutionArgs += " upgrade"
#     }
  
#     $chocoExecutionArgs += " $PackageName -y --source='$Source'"
#     if ($Prerelease) { $chocoExecutionArgs += " --prerelease"}
#     if ($Version) { $chocoExecutionArgs += " --version='$Version'"}
#     if ($PackageParameters -and $PackageParameters -ne '') { $chocoExecutionArgs += " --package-parameters='$PackageParameters'"}
  
#     Invoke-Expression -Command $chocoExecutionArgs
#     $exitCode = $LASTEXITCODE
#     $validExitCodes = @(0, 1605, 1614, 1641, 3010)
#     if ($validExitCodes -notcontains $exitCode) {
#       throw "Error with package installation. See above."
#     }
#   }
  
#   Install-ChocolateyPackage nodejs-lts -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 20.13.1
#   Install-ChocolateyPackage git -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 2.45.1
#   Install-ChocolateyPackage vscode -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 1.89.1
#   Install-ChocolateyPackage openssh -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 8.0.0.1
#   Install-ChocolateyPackage zoom -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 6.0.4.38135
#   Install-ChocolateyPackage slack -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 4.38.125
#   Install-ChocolateyPackage googlechrome -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 125.0.6422.76
#   Install-ChocolateyPackage temurin17 -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 17.0.10

# choco upgrade nodejs-lts -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'20.13.1'" [other options]
# choco upgrade git -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'2.45.1'" [other options]
# choco upgrade vscode -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'1.89.1'" [other options]
# choco upgrade openssh -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'8.0.0.1'" [other options]
# choco upgrade zoom -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'6.0.4.38135'" [other options]
# choco upgrade slack -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'4.38.125'" [other options]
# choco upgrade googlechrome -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'125.0.6422.76'" [other options]
# choco upgrade temurin17 -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'17.0.10'" [other options]

choco install nodejs-lts --version 20.13.1 -y
choco install git --version 2.45.1 -y
choco install vscode --version 1.89.1 -y
choco install openssh --version 8.0.0.1 -y
choco install zoom --version 6.0.4.38135 -y
choco install slack --version 4.38.125 -y
choco install googlechrome --version 125.0.6422.76 -y
choco install temurin17 --version 17.0.10 -y
