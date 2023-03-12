if($env:TERM_PROGRAM -eq 'vscode') 
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
    winfetch
}
