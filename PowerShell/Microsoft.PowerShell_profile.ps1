# edit the following key to change $profile path (Microsoft.PowerShell_profile.ps1) 
#HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders

# allow PowerShell scripts to run
if((Get-ExecutionPolicy -Scope LocalMachine) -ne "RemoteSigned"){Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force}

#Aliases
Set-Alias grep Select-String
Set-Alias nvim 'C:\Program Files\Neovim\bin\nvim.exe'
Set-Alias vim 'C:\Program Files\Neovim\bin\nvim.exe'
Set-Alias vi 'C:\Program Files\Neovim\bin\nvim.exe'

Set-Alias gitup 'git add -A && git commit -m $(Get-Date -F G) && git push'
#Set-Alias gitup 'git add -A && git commit -m $(Get-Date -F G) && git push origin $(git branch | sed -n -e "s/^\* \(.*\)/\1/p")'

#Commands
#ll
function CustomListChildItems { Get-ChildItem $args[0] -force | Sort-Object -Property @{ Expression = 'LastWriteTime'; Descending = $true }, @{ Expression = 'Name'; Ascending = $true } | Format-Table -AutoSize -Property Mode, Length, LastWriteTime, Name }
sal ll CustomListChildItems


