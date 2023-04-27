if($Host.UI.RawUI.WindowSize.Height -le 15) 
{
    oh-my-posh init pwsh --config 'C:\Users\WSwor\AppData\Local\Programs\oh-my-posh\themes\tokyo.omp.json' | Invoke-Expression
    Import-Module -Name Terminal-Icons
}
else
{
    oh-my-posh init pwsh --config 'C:\Users\WSwor\AppData\Local\Programs\oh-my-posh\themes\tokyo.omp.json' | Invoke-Expression
    Import-Module -Name Terminal-Icons
    Import-Module PSReadLine
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionVIewStyle ListView
    Set-PSReadLineKeyHandler -Chord Tab -Function NextHistory
    Set-PSReadLineKeyHandler -Chord Shift+Tab -Function PreviousHistory
}
