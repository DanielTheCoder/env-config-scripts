
function BackupConfigs-vswebessentials([string] $backupPath)
{
    copyFiletoFolder ($env:userprofile + "\Web Essentials\WE2013-settings.xml") ($backupPath + "\VSWebEssentials")
}

function RestoreConfigs-vswebessentials([string] $backupPath)
{
    copyFiletoFolder ($backupPath + "\VSWebEssentials\WE2013-settings.xml") ($env:userprofile + "\Web Essentials") 
}
