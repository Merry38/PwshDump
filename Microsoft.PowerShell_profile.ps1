$env:VIRTUAL_ENV_DISABLE_PROMPT = 0
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\bubblesextra.omp" | Invoke-Expression
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/hotstick.minimal.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/robbyrussel.omp.json' | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Users\Mattia Rizzini\OneDrive - OROBIX\Documenti\PowerShell\Themes\robbyrussel.venv.omp.json' | Invoke-Expression

# Other aliases

Set-Alias -name dumpbin -Value 'C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.33.31629\bin\Hostx64\x64\dumpbin.exe'
Set-Alias -name ll -Value ls
Set-Alias -name la -Value ls
Set-Alias -name touch -Value ni

function which($name) {
    (Get-Command $name).path
}

function .. {
    cd ..
}

function ... {
    cd ../..
}

# Utility functions for python venvs

function mkvenv($name) {
    virtualenv $HOME/.venv/$name
}

function lsvenv {
    ls $HOME/.venv
}

function rmvenv($name) {
    rm $HOME/.venv/$name
}

function workon($name) {
    $current_path = (Get-Item .).FullName

    cd $HOME
    & .venv/$name/Scripts/activate

    cd $current_path
}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
