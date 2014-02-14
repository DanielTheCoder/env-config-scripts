
function BackupConfigs-JSHint([string] $backupPath)
{
    copyFiletoFolder ($env:userprofile + "\.jshintrc") ($backupPath + "\jshint")
}

function RestoreConfigs-JSHint([string] $backupPath)
{
    copyFiletoFolder ($backupPath + "\jshint\.jshintrc") ($env:userprofile)
}
