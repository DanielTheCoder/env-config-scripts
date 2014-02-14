
function BackupConfigs-VSNugetPowershellProfile([string] $backupPath)
{
    copyFiletoFolder ($env:userprofile + "\Documents\WindowsPowerShell\Nuget_profile.ps1") ($backupPath + "\vsnugetpowershellprofile")
}

function RestoreConfigs-VSNugetPowershellProfile([string] $backupPath)
{
    copyFiletoFolder ($backupPath + "\vsnugetpowershellprofile\Nuget_profile.ps1") ($env:userprofile + "\Documents\WindowsPowerShell") 
}