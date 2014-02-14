
function BackupConfigs-Mercurial([string] $backupPath)
{
    copyFiletoFolder ($env:userprofile + "\mercurial.ini") ($backupPath + "\mercurial")
}

function RestoreConfigs-Mercurial([string] $backupPath)
{
    copyFiletoFolder ($backupPath + "\mercurial\mercurial.ini") ($env:userprofile) 
}
