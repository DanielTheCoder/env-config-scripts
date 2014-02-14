
function BackupConfigs-Git([string] $backupPath)
{
    copyFiletoFolder ($env:userprofile + "\.gitignore") ($backupPath + "\git")
    copyFiletoFolder ($env:userprofile + "\.gitconfig") ($backupPath + "\git")
}

function RestoreConfigs-Git([string] $backupPath)
{
    copyFiletoFolder ($backupPath + "\git\.gitignore") ($env:userprofile)
    copyFiletoFolder ($backupPath + "\git\.gitconfig") ($env:userprofile)
}