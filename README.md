# Windows Development Environment Setup Script

This PowerShell script automates the setup of a Windows development environment by installing essential applications and tools using Chocolatey and npm.

## Features

* Installs the following applications and tools:
    * Zoom
    * Slack
    * Google Chrome
    * ProtonVPN
    * Node.js
    * npm
    * Java 17 (LTS)
    * Visual Studio Code
    * Salesforce CLI (installed using npm)

## Prerequisites

* **PowerShell:**  Ensure that PowerShell is installed on your system. It is typically included with Windows.
* **Internet Connection:**  A stable internet connection is required for downloading and installing the applications and tools.

## Usage

1. **Clone/Download:**
   * **Git (Recommended):** If you're familiar with Git, clone this repository:
      ```bash
      git clone [https://github.com/chininchu/install-scripts.git](https://github.com/chininchu/install-scripts.git)
      ```
   * **Direct Download:** Otherwise, download the `application-scripts.ps1` file directly from the repository.

2. **Run the Script:**
    * Open a PowerShell terminal as an administrator (right-click PowerShell and choose "Run as Administrator").
    * Navigate to the directory where you saved or cloned the script.
    * Run the following command:

      ```powershell
         Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/chininchu/install-scripts/main/application-scripts.ps1/'))
      ```



## Important Notes

* **Administrator Privileges:**  You must run the script as an administrator to install software.
* **Security:** Always be cautious when running scripts from the internet. Review the source code before executing to ensure it aligns with your expectations and security practices.

## Troubleshooting

If you encounter any errors, try the following:

* **Check Pre-Existing Installations:** Ensure you don't already have any of the applications or tools installed, as this might cause conflicts.
* **Execution Policy:** If you get an error related to the execution policy, try running the simulation command (with `-WhatIf`) or setting the execution policy to `RemoteSigned` before running the script directly.
* **Internet Connection:**  Make sure you have a stable internet connection.

## License

This script is provided under the [MIT License](LICENSE).
