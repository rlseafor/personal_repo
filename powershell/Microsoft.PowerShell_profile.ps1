oh-my-posh --init --shell pwsh --config C:\Users\rseaford\code\personal_repo\ohmyposh.json | Invoke-Expression

Import-Module -Name Terminal-Icons
Install-Module -Name Terminal-Icons -Repository PSGallery

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows