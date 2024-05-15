# Windows Application Installer Script

This PowerShell script automates the installation of several common applications on a Windows machine. It leverages the Chocolatey package manager for streamlined installation.

## Features

* Installs the following applications:
    * Zoom
    * Slack
    * Google Chrome
    * ProtonVPN

## Prerequisites

* **Chocolatey:** This script requires Chocolatey to be installed on your system. You can download and install it from [https://chocolatey.org/install](https://chocolatey.org/install).
* **PowerShell:**  Ensure that PowerShell is installed on your system. It is typically included with Windows.

## Usage

1. **Clone/Download:**
   * **Git (Recommended):** If you're familiar with Git, clone this repository:
      ```bash
      https://github.com/chininchu/install-scripts.git
   
      ```
   * **Direct Download:** Otherwise, download the `application-scripts.ps1` file directly from the repository.

2. **Run the Script (Standard Installation):**
    * Open a PowerShell terminal as an administrator (right-click PowerShell and choose "Run as Administrator").
    * Navigate to the directory where you saved or cloned the script.
    * Run the following command:

      ```powershell
      .\application-scripts.ps1
      ```

3. **Run the Script (WhatIf Simulation - Testing):**
    * Open a PowerShell terminal as an administrator.
    * Run the following command to simulate the installation without actually installing anything:

      ```powershell
      powershell -ExecutionPolicy Bypass -Command "& { (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/chininchu/install-scripts/main/run_scripts.ps1') } -WhatIf"

      ```

## Important Notes

* **Administrator Privileges:**  You must run the script or the simulation command as an administrator to install software or test the script accurately.
* **Security:** Always be cautious when running scripts from the internet. Review the source code before executing to ensure it aligns with your expectations and security practices.

## Troubleshooting

If you encounter any errors, try the following:

* **Check Chocolatey Installation:** Ensure that Chocolatey is installed correctly and accessible from your PowerShell session.
* **Execution Policy:** If you get an error related to the execution policy, try running the simulation command or setting the execution policy to `RemoteSigned` before running the script directly.
* **Internet Connection:**  Make sure you have a stable internet connection, as the script needs to download packages from Chocolatey.

## License

This script is provided under the [MIT License](LICENSE).
