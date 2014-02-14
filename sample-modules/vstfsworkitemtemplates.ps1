
function BackupConfigs-VSTFSWorkitemTemplates([string] $backupPath)
{
    copyFiletoFolder ($env:userprofile + "\Documents\Work Item Templates\TemplateStorageMetadata.xml") ($backupPath + "\vstfsworkitemtemplates")
}

function RestoreConfigs-VSTFSWorkitemTemplates([string] $backupPath)
{
    copyFiletoFolder ($backupPath + "\vstfsworkitemtemplates\TemplateStorageMetadata.xml") ($env:userprofile + "\Documents\Work Item Templates") 
}
