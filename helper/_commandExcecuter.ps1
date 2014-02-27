# DEFAULT Configuration
#$baseCommandName = "BackupConfigs-" | "RestoreConfigs-"

. .\helper\FilesAndFolders.ps1
. .\helper\WriteHost.ps1

function Env-Conf-Excecute (
    [string] $baseCommandName,
    [string] $backupPathOrFolder = $env_conf_backupPathDefault, 
    [string] $profilePath = $env_conf_profilePath) {
    Write-Host "***************************"
    Write-Host "** Env-Conf ***************"
    Write-Host "***************************"
    Write-Host ""

    #Write-Host "*** Global Imports ***********"
    #$identation++
    #Import-Scripts "global-helper" $env_conf_scriptFolder
    #Import-Scripts "global-modules" ($env_conf_scriptsRoot + "\modules")
    #$identation--
    #Write-Host "******************************"

    #Write-Host "*** User-Profile Imports ***********"
    #$identation++
    #Import-Scripts "helper" ($env:userprofile + "\Documents\WindowsPowerShell\env-conf\helper")
    #Import-Scripts "modules" ($env:userprofile + "\Documents\WindowsPowerShell\env-conf\modules")
    #$identation--
    #Write-Host "******************************"
    #Write-Host ""

    # Loading profile
    if (Test-Path -path $profilePath) {
            Write-Host "Using config: ", $profilePath
            . ($profilePath)
            Write-Host ""
    }
    else {
        $profilePath = "env-conf_profile." + $env:Computername + ".ps1"
        if (Test-Path -path $profilePath)
        {
            Write-Host "Using config: ", $profilePath
            . ($env_conf_scriptsFolder + "\" + $profilePath)
            Write-Host ""
        }
    }
    
    #Write-Host ("  backupPathOrFolder: " + $backupPathOrFolder)
    #Write-Host ("  env_conf_backupPath: " + $env_conf_backupPath)

    # only take custom path if it is not empty
    if ($env_conf_backupPath) {
        $backupPathOrFolder = $env_conf_backupPath    
    }

    #Write-Host ("  backupPathOrFolder: " + $backupPathOrFolder)
    #Write-Host ("  env_conf_backupPath: " + $env_conf_backupPath)

    Write-Host "*** Run-Scripts ***********"
    $identation++
    Run-Scripts "Global" $env_conf_modules_global $baseCommandName
    Run-Scripts "User" $env_conf_modules_user $baseCommandName
    $identation--
    Write-Host "***************************"
}
