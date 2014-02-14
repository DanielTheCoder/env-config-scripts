
function BackupConfigs-PSProfile([string] $backupPath)
{
    copyFiletoFolder ($env:userprofile + "\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1") ($backupPath + "\powershell.profiles")
}

function RestoreConfigs-PSProfile([string] $backupPath)
{
    copyFiletoFolder ($backupPath + "\powershell.profiles\Microsoft.PowerShell_profile.ps1.")  ($env:userprofile + "\Documents\WindowsPowerShell")
}