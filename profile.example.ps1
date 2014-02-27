Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

. .\helper\FilesAndFolders.ps1

# global path configuration
$env_conf_scriptFolder = $PSScriptRoot
$env_conf_modules_global = ($env_conf_scriptFolder + "\modules")

# user path configuration
$env_conf_modules_user = $(Join-Path $(Get-ProfilePath ) "env-conf\modules")
$env_conf_profilePath = $(Join-Path $(Get-ProfilePath ) "env-conf\env-conf_profile.ps1")
$env_conf_backupPathDefault = $(Join-Path $(Get-ProfilePath ) "env-conf.backup")


# create default profile
if(!(Test-Path $env_conf_profilePath)) {
    Write-Host "Creating env-conf profile...`n   $env_conf_profilePath"
    $newfile = New-Item $env_conf_profilePath -Force -Type File -ErrorAction Stop

    Write-Host "Adding env-config defaults..."
@"
# env-config user configuration
# uncomment the following lines to customize user folders

# `$env_conf_backupPath = `$(Join-Path `$PSScriptRoot "env-conf.backup")
# `$env_conf_modules_user = `$(Join-Path `$PSScriptRoot "env-conf\modules")

"@ | Out-File $env_conf_profilePath -Append
}

if(!(Test-Path $env_conf_modules_user)) {
	$folder = New-Item $env_conf_modules_user -Force -Type Directory -ErrorAction Stop
}
# Load env-conf module from current directory
Import-Module .\env-conf

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
# Import-Module env-conf

Pop-Location

