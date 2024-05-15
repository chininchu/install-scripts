# Set Execution Policy to allow running scripts
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Install Chocolatey packages
choco install zoom slack googlechrome protonvpn -y  

# Download and install ASUS Driver (adjust the path if needed)
$url = "https://dlcdnets.asus.com/pub/ASUS/LCD%20Monitors/MB165B/ASUS_MB_series_driver_Win7_8.1_10_11.exe.zip?model=MB165B"
$output = "C:\Temp\ASUS_MB_driver.exe.zip"

# Create Temp directory if it doesn't exist
if (-not (Test-Path "C:\Temp")) {
    New-Item -ItemType Directory -Path "C:\Temp"
}

Invoke-WebRequest -Uri $url -OutFile $output

Expand-Archive $output -DestinationPath "C:\Temp\ASUS_MB_driver"

& "C:\Temp\ASUS_MB_driver\Setup.exe" /S
Remove-Item $output -Force
Remove-Item "C:\Temp\ASUS_MB_driver" -Recurse -Force
