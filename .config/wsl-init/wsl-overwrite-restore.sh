# exported file is stored in /mnt/c/Users/taishi/wsl-export
wsl --unregister Ubuntu
mkdir $env:LOCALAPPDATA\Ubuntu
wsl --import Ubuntu $env:LOCALAPPDATA\Ubuntu ubuntu.tar --version 2
ubuntu config --default-user taishi

