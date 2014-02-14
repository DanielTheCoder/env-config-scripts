
function BackupConfigs-conemu([string] $backupPath)
{
    CreateFolderIfNotExists ($backupPath + "\conemu\")
    $filePath = ($backupPath + "\conemu\conemu.reg")
    reg.exe export "HKEY_CURRENT_USER\Software\ConEmu\.Vanilla " $filePath /y
}

function RestoreConfigs-conemu([string] $backupPath)
{
    $filePath = ($backupPath + "\conemu\conemu.reg")
    reg.exe import $filePath
}