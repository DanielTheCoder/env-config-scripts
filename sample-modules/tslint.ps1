
function BackupConfigs-TSLint([string] $backupPath)
{
    copyFiletoFolder ($env:userprofile + "\tslint.json") ($backupPath + "\tslint")
}

function RestoreConfigs-TSLint([string] $backupPath)
{
    copyFiletoFolder ($backupPath + "\tslint\tslint.json") ($env:userprofile) 
}
