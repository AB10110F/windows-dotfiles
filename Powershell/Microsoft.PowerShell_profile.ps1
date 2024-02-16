Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons
Import-Module PSReadLine

Set-PSReadlineOption -EditMode vi
Set-PSReadlineOption -ViModeIndicator Cursor
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord Tab -Function NextHistory
Set-PSReadLineKeyHandler -Chord Shift+Tab -Function PreviousHistory

# map jk
Set-PSReadLineKeyHandler -vimode insert -Chord "k" -ScriptBlock { mapTwoLetterNormal 'k' 'j' }
Set-PSReadLineKeyHandler -vimode insert -Chord "j" -ScriptBlock { mapTwoLetterNormal 'j' 'k' }

function mapTwoLetterNormal($a, $b)
{
  mapTwoLetterFunc $a $b -func $function:setViCommandMode
}
function setViCommandMode
{
    [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
}

function mapTwoLetterFunc($a,$b,$func)
{
  if ([Microsoft.PowerShell.PSConsoleReadLine]::InViInsertMode()) {
    $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    if ($key.Character -eq $b)
    {
        &$func
    }
    else
    {
      [Microsoft.Powershell.PSConsoleReadLine]::Insert("$a")
      # Representation of modifiers (like shift) when ReadKey uses IncludeKeyDown
      if ($key.Character -eq 0x00)
      {
        return
      }
      else
      {
        # Insert func above converts escape characters to their literals, e.g.
        # converts return to ^M. This doesn't.
        $wshell = New-Object -ComObject wscript.shell
        $wshell.SendKeys("{$($key.Character)}")
      }
    }
  }
}

# Pair Quotes
Set-PSReadLineKeyHandler -Chord '"',"'" `
                         -BriefDescription SmartInsertQuote `
                         -LongDescription "Insert paired quotes if not already on a quote" `
                         -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    if ($line.Length -gt $cursor -and $line[$cursor] -eq $key.KeyChar) {
        # Just move the cursor
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
    }
    else {
        # Insert matching quotes, move cursor to be in between the quotes
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)" * 2)
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor - 1)
    }
}

if($Host.UI.RawUI.WindowSize.Height -le 15 -or $Host.UI.RawUI.WindowSize.Width -le 50)
{
    Set-PSReadLineOption -PredictionVIewStyle InlineView
}
else
{
    Set-PSReadLineOption -PredictionVIewStyle ListView
}
