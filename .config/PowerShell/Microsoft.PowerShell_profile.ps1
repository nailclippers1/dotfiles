# edit the following key to change $profile path (Microsoft.PowerShell_profile.ps1) 
#HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders

# allow PowerShell scripts to run
if((Get-ExecutionPolicy -Scope LocalMachine) -ne "RemoteSigned"){Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force}

# Symbolic links
$source = "Dropbox\Sources"
if(!(Test-Path .config)) {
    New-Item -Name .config -ItemType Junction -Value $HOME\dotfiles\.config
}
if(!(Test-Path bin)) {
    New-Item -Name bin -ItemType Junction -Value $source\bin
}
if(!(Test-Path share)) {
    New-Item -Name share -ItemType Junction -Value $source\share
}

# Environment variables
$env:LANG="en"
$env:MOCWORD_DATA="$HOME\share\dict\mocword.sqlite"
$env:XDG_CACHE_HOME="$HOME\.cache"
$env:XDG_CONFIG_HOME="$HOME\.config"

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
