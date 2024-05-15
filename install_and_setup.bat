@echo off
REM Run PowerShell script to install applications and set execution policy
powershell -ExecutionPolicy Bypass -File ".\install_applications.ps1" -WhatIf

REM SSH Key Generation (Batch Script - Simulation)
call generate_ssh_key.bat
