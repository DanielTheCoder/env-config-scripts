#Set up
. .\helper\_commandExcecuter.ps1

function Env-Conf-Backup()
{
    Env-Conf-Excecute "BackupConfigs-"    
}

function Env-Conf-Restore()
{
    Env-Conf-Excecute "RestoreConfigs-"
}
