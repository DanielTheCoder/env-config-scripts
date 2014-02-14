
function BackupConfigs-PSISEProfile([string] $backupPath)
{
    copyFiletoFolder ($env:userprofile + "\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1") ($backupPath + "\powershell.profiles")
}

function RestoreConfigs-PSISEProfile([string] $backupPath)
{
 copyFiletoFolder ($backupPath + "\powershell.profiles\Microsoft.PowerShellISE_profile.ps1.")  ($env:userprofile + "\Documents\WindowsPowerShell")
}
