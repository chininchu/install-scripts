# # function Install-ChocolateyPackage {
# #     param (
# #       [Parameter(Mandatory, Position=0)]
# #       [string]$PackageName,
  
# #       [string]$Source,
  
# #       [alias("Params")]
# #       [string]$PackageParameters,
  
# #       [string]$Version,
  
# #       [alias("Pre")]
# #       [switch]$Prerelease,
  
# #       [switch]$UseInstallNotUpgrade
# #     )
  
# #     $chocoExecutionArgs = "choco.exe"
# #     if ($UseInstallNotUpgrade) {
# #       $chocoExecutionArgs += " install"
# #     } else {
# #       $chocoExecutionArgs += " upgrade"
# #     }
  
# #     $chocoExecutionArgs += " $PackageName -y --source='$Source'"
# #     if ($Prerelease) { $chocoExecutionArgs += " --prerelease"}
# #     if ($Version) { $chocoExecutionArgs += " --version='$Version'"}
# #     if ($PackageParameters -and $PackageParameters -ne '') { $chocoExecutionArgs += " --package-parameters='$PackageParameters'"}
  
# #     Invoke-Expression -Command $chocoExecutionArgs
# #     $exitCode = $LASTEXITCODE
# #     $validExitCodes = @(0, 1605, 1614, 1641, 3010)
# #     if ($validExitCodes -notcontains $exitCode) {
# #       throw "Error with package installation. See above."
# #     }
# #   }
  
# #   Install-ChocolateyPackage nodejs-lts -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 20.13.1
# #   Install-ChocolateyPackage git -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 2.45.1
# #   Install-ChocolateyPackage vscode -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 1.89.1
# #   Install-ChocolateyPackage openssh -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 8.0.0.1
# #   Install-ChocolateyPackage zoom -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 6.0.4.38135
# #   Install-ChocolateyPackage slack -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 4.38.125
# #   Install-ChocolateyPackage googlechrome -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 125.0.6422.76
# #   Install-ChocolateyPackage temurin17 -Source https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1 -Version 17.0.10

# # choco upgrade nodejs-lts -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'20.13.1'" [other options]
# # choco upgrade git -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'2.45.1'" [other options]
# # choco upgrade vscode -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'1.89.1'" [other options]
# # choco upgrade openssh -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'8.0.0.1'" [other options]
# # choco upgrade zoom -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'6.0.4.38135'" [other options]
# # choco upgrade slack -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'4.38.125'" [other options]
# # choco upgrade googlechrome -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'125.0.6422.76'" [other options]
# # choco upgrade temurin17 -y --source="'https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1'" --version "'17.0.10'" [other options]

# # choco install nodejs-lts --version 20.13.1 -y
# # choco install git --version 2.45.1 -y
# # choco install vscode --version 1.89.1 -y
# # choco install openssh --version 8.0.0.1 -y
# # choco install zoom --version 6.0.4.38135 -y
# # choco install slack --version 4.38.125 -y
# # choco install googlechrome --version 125.0.6422.76 -y
# # choco install temurin17 --version 17.0.10 -y






#   ## 1. REQUIREMENTS ##
# ### Here are the requirements necessary to ensure this is successful.

# ### a. Internal/Private Cloud Repository Set Up ###
# #### You'll need an internal/private cloud repository you can use. These are
# ####  generally really quick to set up and there are quite a few options.
# ####  Chocolatey Software recommends Nexus, Artifactory Pro, or ProGet as they
# ####  are repository servers and will give you the ability to manage multiple
# ####  repositories and types from one server installation.

# ### b. Download Chocolatey Package and Put on Internal Repository ###
# #### You need to have downloaded the Chocolatey package as well.
# ####  Please see https://chocolatey.org/install#organization

# ### c. Other Requirements ###

# #### We initialize a few things that are needed by this script - there are no other requirements.
# $ErrorActionPreference = "Stop"

# #### Set TLS 1.2 (3072) as that is the minimum required by various up-to-date repositories.
# #### Use integers because the enumeration value for TLS 1.2 won't exist
# #### in .NET 4.0, even though they are addressable if .NET 4.5+ is
# #### installed (.NET 4.5 is an in-place upgrade).
# [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# #### We use this variable for future REST calls.
# $RequestArguments = @{
#     UseBasicParsing = $true
# }

# ## 2. TOP LEVEL VARIABLES ##

# ### a. Your internal repository url (the main one). ###
# ####  Should be similar to what you see when you browse
# #### to https://community.chocolatey.org/api/v2/
# $NugetRepositoryUrl = "https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1"

# ### b. Internal Repository Credential ###
# #### If required, add the repository access credential here
# # $NugetRepositoryCredential = [PSCredential]::new(
# #     "username",
# #     ("password" | ConvertTo-SecureString -AsPlainText -Force)
# # )
# # $RequestArguments.Credential = $NugetRepositoryCredential

# ### c. Chocolatey nupkg download url ###
# #### This url should result in an immediate download when you navigate to it
# $ChocolateyDownloadUrl = "$($NugetRepositoryUrl.TrimEnd('/'))/package/chocolatey.2.2.2.nupkg"

# ### d. Chocolatey Central Management (CCM) ###
# #### If using CCM to manage Chocolatey, add the following:
# #### i. Endpoint URL for CCM
# # $ChocolateyCentralManagementUrl = "https://chocolatey-central-management:24020/ChocolateyManagementService"

# #### ii. If using a Client Salt, add it here
# # $ChocolateyCentralManagementClientSalt = "clientsalt"

# #### iii. If using a Service Salt, add it here
# # $ChocolateyCentralManagementServiceSalt = "servicesalt"

# ## 3. ENSURE CHOCOLATEY IS INSTALLED ##
# ### Ensure Chocolatey is installed from your internal repository

# #### Download the Nupkg, appending .zip to the filename to handle archive cmdlet limitations
# if (-not (Get-Command choco.exe -ErrorAction SilentlyContinue)) {
#     $TempDirectory = Join-Path $env:Temp "chocolateyInstall"
#     if (-not (Test-Path $TempDirectory -PathType Container)) {
#         $null = New-Item -Path $TempDirectory -ItemType Directory
#     }
#     $DownloadedNupkg = Join-Path $TempDirectory "$(Split-Path $ChocolateyDownloadUrl -Leaf).zip"
#     Invoke-WebRequest -Uri $ChocolateyDownloadUrl -OutFile $DownloadedNupkg @RequestArguments

#     #### Extract the Nupkg, and run the chocolateyInstall script
#     if (Get-Command Microsoft.PowerShell.Archive\Expand-Archive -ErrorAction SilentlyContinue) {
#         Microsoft.PowerShell.Archive\Expand-Archive -Path $DownloadedNupkg -DestinationPath $TempDirectory -Force
#     } else {
#         # PowerShell versions <4.0 do not have this function available
#         try {
#             $shellApplication = New-Object -ComObject Shell.Application
#             $zipPackage = $shellApplication.NameSpace($DownloadedNupkg)
#             $destinationFolder = $shellApplication.NameSpace($TempDirectory)
#             $destinationFolder.CopyHere($zipPackage.Items(), 0x10)
#         } catch {
#             Write-Warning "Unable to unzip package using built-in compression."
#             throw $_
#         }
#     }

#     & $(Join-Path $TempDirectory "tools\chocolateyInstall.ps1")
# }

# if (-not (Get-Command choco.exe -ErrorAction SilentlyContinue)) {
#     refreshenv
# }

# ## 4. CONFIGURE CHOCOLATEY BASELINE ##
# ### a. FIPS Feature ###
# #### If you need FIPS compliance - make this the first thing you configure
# #### before you do any additional configuration or package installations
# # choco feature enable -n useFipsCompliantChecksums

# ### b. Apply Recommended Configuration ###
# #### Move cache location so Chocolatey is very deterministic about
# #### cleaning up temporary data and the location is secured to admins
# choco config set --name cacheLocation --value C:\ProgramData\chocolatey\cache

# #### Increase timeout to at least 4 hours
# choco config set --name commandExecutionTimeoutSeconds --value 14400

# #### Turn off download progress when running choco through integrations
# choco feature disable --name showDownloadProgress

# ### c. Sources ###
# #### Remove the default community package repository source
# choco source list --limitoutput | ConvertFrom-Csv -Header 'Name', 'Location' -Delimiter '|' | ForEach-Object {
#     if ($_.Location -eq 'https://community.chocolatey.org/api/v2/') {
#         choco source remove -n $_.Name
#     }
# }

# #### Add internal default sources
# #### You could have multiple sources here, so we will provide an example
# #### of one using the remote repo variable here

# #### NOTE: This EXAMPLE may require changes
# if ($NugetRepositoryCredential) {
#     choco source add --name ChocolateyInternal --source $NugetRepositoryUrl --user $NugetRepositoryCredential.UserName --password $NugetRepositoryCredential.GetNetworkCredential().Password --priority 1
# } else {
#     choco source add --name ChocolateyInternal --source $NugetRepositoryUrl --priority 1
# }

# ### b. Keep Chocolatey Up To Date ###
# #### Keep chocolatey up to date based on your internal source
# #### You control the upgrades based on when you push an updated version
# ####  to your internal repository.
# #### Note the source here is to the OData feed, similar to what you see
# ####  when you browse to https://community.chocolatey.org/api/v2/
# choco upgrade chocolatey --confirm

# ## 5. ENSURE CHOCOLATEY FOR BUSINESS ##
# ### If you don't have Chocolatey for Business (C4B), you'll want to remove from here down.

# ### a. Ensure The License File Is Installed ###
# #### Create a license package using script from https://docs.chocolatey.org/en-us/how-tos/setup-offline-installation#exercise-4-create-a-package-for-the-license
# choco install chocolatey-license --source $NugetRepositoryUrl --confirm

# ### b. Disable The Licensed Source ###
# #### The licensed source cannot be removed, so it must be disabled.
# #### This must occur after the license has been set by the license package.
# if ("chocolatey-license" -in (choco list --localonly --limitoutput | ConvertFrom-Csv -Header "Name" -Delimiter "|").Name) {
#     choco source disable --name chocolatey.licensed
# } else {
#     Write-Warning "Not disabling 'chocolatey.licensed' feed, as Chocolatey-License has not been installed."
# }

# ### c. Ensure Chocolatey Licensed Extension ###
# #### You will have downloaded the licensed extension to your internal repository
# #### as you have disabled the licensed repository in step 5b.

# #### Ensure the chocolatey.extension package (aka Chocolatey Licensed Extension)
# if ("chocolatey-license" -in (choco list --localonly --limitoutput | ConvertFrom-Csv -Header "Name" -Delimiter "|").Name) {
#     choco install chocolatey.extension --source $NugetRepositoryUrl --confirm
# } else {
#     Write-Warning "Not installing 'chocolatey.extension', as Chocolatey-License has not been installed."
# }

# #### The Chocolatey Licensed Extension unlocks all of the following, which also have configuration/feature items available with them. You may want to visit the feature pages to see what you might want to also enable:
# #### - Package Builder - https://docs.chocolatey.org/en-us/features/paid/package-builder
# #### - Package Internalizer - https://docs.chocolatey.org/en-us/features/paid/package-internalizer
# #### - Package Synchronization (3 components) - https://docs.chocolatey.org/en-us/features/paid/package-synchronization
# #### - Package Reducer - https://docs.chocolatey.org/en-us/features/paid/package-reducer
# #### - Package Audit - https://docs.chocolatey.org/en-us/features/paid/package-audit
# #### - Package Throttle - https://docs.chocolatey.org/en-us/features/paid/package-throttle
# #### - CDN Cache Access - https://docs.chocolatey.org/en-us/features/paid/private-cdn
# #### - Branding - https://docs.chocolatey.org/en-us/features/paid/branding
# #### - Self-Service Anywhere (more components will need to be installed and additional configuration will need to be set) - https://docs.chocolatey.org/en-us/features/paid/self-service-anywhere
# #### - Chocolatey Central Management (more components will need to be installed and additional configuration will need to be set) - https://docs.chocolatey.org/en-us/features/paid/chocolatey-central-management
# #### - Other - https://docs.chocolatey.org/en-us/features/paid/

# ### d. Ensure Self-Service Anywhere ###
# #### If you have desktop clients where users are not administrators, you may
# #### to take advantage of deploying and configuring Self-Service anywhere
# choco feature disable --name showNonElevatedWarnings
# choco feature enable --name useBackgroundService
# choco feature enable --name useBackgroundServiceWithNonAdministratorsOnly
# choco feature enable --name allowBackgroundServiceUninstallsFromUserInstallsOnly
# choco config set --name allowedBackgroundServiceCommands --value "install,upgrade,uninstall"

# ### e. Ensure Chocolatey Central Management ###
# #### If you want to manage and report on endpoints, you can set up and configure
# ### Central Management. There are multiple portions to manage, so you'll see
# ### a section on agents here along with notes on how to configure the server
# ### side components.
# if ($ChocolateyCentralManagementUrl) {
#     choco install chocolatey-agent --source $NugetRepositoryUrl --confirm
#     choco config set --name CentralManagementServiceUrl --value $ChocolateyCentralManagementUrl
#     if ($ChocolateyCentralManagementClientSalt) {
#         choco config set --name centralManagementClientCommunicationSaltAdditivePassword --value $ChocolateyCentralManagementClientSalt
#     }
#     if ($ChocolateyCentralManagementServiceSalt) {
#         choco config set --name centralManagementServiceCommunicationSaltAdditivePassword --value $ChocolateyCentralManagementServiceSalt
#     }
#     choco feature enable --name useChocolateyCentralManagement
#     choco feature enable --name useChocolateyCentralManagementDeployments
# }



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


choco install nodejs-lts --version 20.13.1 -y
choco install git --version 2.45.1 -y
choco install vscode --version 1.89.1 -y
choco install openssh --version 8.0.0.1 -y
choco install zoom --version 6.0.4.38135 -y
choco install slack --version 4.38.125 -y
choco install googlechrome --version 125.0.6422.76 -y
choco install temurin17 --version 17.0.10 -y