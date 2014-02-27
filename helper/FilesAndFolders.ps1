
function CopyFileToFolder ([string] $Source,[string] $destination)
{  
    if (!(Test-Path $source)) { return }

    # get filename  
    #$filename = $source.substring($source.lastindexofany("\") +1 ,$source.length - ($source.lastindexofany("\")+1))  
    # verify if file exists  
    #if (Test-Path $destination$file) {  
    #    $ext = Get-Date -format 'yyMMddhhmmss'  
    #    Rename-Item $destination$filename $ext"."$filename  
    #}  
    
    CreateFolderIfNotExists $destination
    Copy-Item $source $destination -Force
}  

function CreateFolderIfNotExists([string] $destinationFolder) 
{
    if (!(Test-Path -path $destinationFolder)) 
    {
        $new = New-Item $destinationFolder -Type Directory
    }
}

function Get-ProfilePath()
{
    return $profile.TrimEnd("Microsoft.PowerShell_profile.ps1").TrimEnd("Microsoft.PowerShellISE_profile.ps1")
}

function Import-Scripts([string] $displayText, [System.IO.FileInfo]$importPath)
{
    $scriptsFolder = Join-Path $importPath  "*.*"
    $scriptFiles = Get-ChildItem $scriptsFolder -include *.ps1,*.psm1 -exclude _*.ps1
    write-idented $("Importing (" + $displayText + ")")
    #$scriptFiles
    foreach ($file in $scriptFiles)
    {
        write-idented " - ", $file.Name
        . $file
    }
    return $scriptFiles
}

function Run-Scripts([string] $displayText, [System.IO.FileInfo]$importPath,[string]$baseCommandName)
{
    $scriptsFolder = Join-Path $importPath  "*.*"
    $scriptFiles = Get-ChildItem $scriptsFolder -include *.ps1,*.psm1 -exclude _*.ps1
    write-idented $("Run (" + $displayText + ")")

    foreach ($file in $scriptFiles)
    {
        $commandName = ($baseCommandName + $file.BaseName)
        Write-idented " - ", $commandName
        . $file
        &$commandName $backupPathOrFolder
    }
}
