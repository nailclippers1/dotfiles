# edit the following key to change $profile path (Microsoft.PowerShell_profile.ps1) 
#HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders

# Aliases
Set-Alias grep Select-String
Set-Alias Chrome "C:\Program Files\Google\Chrome\Application\chrome.exe"
Set-Alias Firefox "C:\Program Files\Mozilla Firefox\firefox.exe"
Set-Alias nvim 'C:\Program Files\Neovim\bin\nvim.exe'
Set-Alias vim 'C:\Program Files\Neovim\bin\nvim.exe'
Set-Alias vi 'C:\Program Files\Neovim\bin\nvim.exe'

# gitup -> git add & commit & push
#git add -A && git commit -m "$(date)" && git push origin $(git branch | sed -n -e "s/^\* \(.*\)/\1/p")
function gitup(){
    git add -A && git commit -m $(Get-Date -F G) && git push
}

#ll
function CustomListChildItems { Get-ChildItem $args[0] -force | Sort-Object -Property @{ Expression = 'LastWriteTime'; Descending = $true }, @{ Expression = 'Name'; Ascending = $true } | Format-Table -AutoSize -Property Mode, Length, LastWriteTime, Name }
sal ll CustomListChildItems

#touch
function touch($filename) { New-Item -type file $filename }
