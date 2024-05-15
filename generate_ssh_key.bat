@echo off
echo We're now going to simulate generating an SSH public/private key pair. This key is like a fingerprint for you on your laptop. We'll use this key for connecting to GitHub without having to enter a password.

echo Please enter your name (e.g., John Doe):
set /p USERSNAME=

echo Please enter your GitHub email:
set /p GITHUBEMAIL=

:validate_email
if not "%GITHUBEMAIL%"=="%GITHUBEMAIL:*-@*=%" (
  echo Invalid email format.
  echo Please enter a valid email address (e.g., name@example.com):
  set /p GITHUBEMAIL=
  goto validate_email
)

REM git config --global user.name "%USERSNAME%"
REM git config --global user.email "%GITHUBEMAIL%"
echo Simulating Git configuration...

REM echo Generating SSH key pair...
REM ssh-keygen -t ed25519 -C "%USERSNAME%" -f "%USERPROFILE%\.ssh\id_ed25519"
echo Simulating SSH key pair generation...

REM echo Copying public key to clipboard...
REM clip < "%USERPROFILE%\.ssh\id_ed25519.pub"
echo Would normally copy public key to clipboard...

echo We would have copied your SSH public key to the clipboard. 
echo IN A REAL RUN, you would then follow these steps:
echo 1. Open your web browser and go to: https://github.com/settings/ssh
echo 2. Click the "New SSH key" button.
echo 3. Give the key a title (e.g., MyLaptop).
echo 4. Paste your public key (which would be in your clipboard) into the "Key" field.
echo 5. Click "Add SSH key."

pause
