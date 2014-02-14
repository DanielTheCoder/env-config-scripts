[int]$identation = 0
[int]$identationDepth = 3

function write-idented([string]$text)
{
    Write-Output $text.PadLeft($text.Length + ($identationDepth * $identation)) 
}

function write-identedWarn([string]$text)
{
    Write-Warning $text.PadLeft($text.Length + ($identationDepth * $identation)) 
}