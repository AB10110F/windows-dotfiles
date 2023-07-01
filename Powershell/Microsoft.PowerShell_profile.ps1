#oh-my-posh init pwsh --config 'C:\Users\WSwor\AppData\Local\Programs\oh-my-posh\themes\tokyoCode.omp.json' | Invoke-Expression
Invoke-Expression (&starship init powershell)

if($Host.UI.RawUI.WindowSize.Height -le 15) 
{
    Import-Module -Name Terminal-Icons
}
else
{
    Import-Module -Name Terminal-Icons
    Import-Module PSReadLine
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionVIewStyle ListView
    Set-PSReadLineKeyHandler -Chord Tab -Function NextHistory
    Set-PSReadLineKeyHandler -Chord Shift+Tab -Function PreviousHistory
}
