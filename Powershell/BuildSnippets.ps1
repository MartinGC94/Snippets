#Requires -Modules "ISE"

$Data=Get-ChildItem -Path "$PSScriptRoot\Snippets" -Recurse -Filter *.psd1 | Import-PowerShellDataFile | ForEach-Object -Process {
    [pscustomobject]$_
}

#Create ISE snippets
foreach ($Item in $Data)
{
    $IseSnippet=@{
        Title=$Item.SnippetName
        Description=$Item.Description
        Text=$Item.Snippet
        Author=$Item.Author
        CaretOffset=$Item.CaretOffset
    }
    New-IseSnippet @IseSnippet
}

#Create VS Code snippets
$VsCodeSnippets=@{}
foreach ($Item in $Data)
{
    $RawSnippet=$Item.Snippet
    $ModifiedSnippet=$RawSnippet.Replace('$','\$')

    $CaretOffset=$Item.CaretOffset+($ModifiedSnippet.Length - $RawSnippet.Length)
    $ModifiedSnippet=$ModifiedSnippet.Insert($CaretOffset,'$0')

    $Body=$ModifiedSnippet.Replace("`r",'').Split("`n")

    $VsCodeSnippets.Add($Item.SnippetName,
        [pscustomobject]@{
            prefix=$Item.SnippetName
            body=$Body
            description=$Item.Description
        }
    )
}
[pscustomobject]$VsCodeSnippets | ConvertTo-Json | Out-File "$PSScriptRoot\BuiltSnippets\VS Code\PowerShell.json" -Encoding default -Force