if (Get-Module env-conf) { return }

Push-Location $psScriptRoot
.\helper\GitCheckVersion.ps1 > $null

if(!(Test-Path $PROFILE)) {
    Write-Host "Creating PowerShell profile...`n$PROFILE"
    New-Item $PROFILE -Force -Type File -ErrorAction Stop -WhatIf:$WhatIf > $null
}


. .\env-conf.ps1

Pop-Location


Export-ModuleMember `
    -Alias @() `
    -Function @(
        'Env-Conf-Backup',
        'Env-Conf-Restore')


