@{
    SnippetName="Argument Completer Scriptblock"
    Description="Basic scriptblock for argumentcompleters"
    Author="MartinGC94"
    CaretOffset=565

Snippet=@'
{
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    #Command or static items used for completion
    $AllFiles=Get-ChildItem -Path "C:\"

    foreach ($Item in $AllFiles)
    {
        $CompletionText = $Item.Name
        $ListItemText   = $Item.Name
        $ResultType     = [System.Management.Automation.CompletionResultType]::ParameterValue
        $ToolTip        = $Item.Name

        [System.Management.Automation.CompletionResult]::new($CompletionText,$ListItemText,$ResultType,$ToolTip)
    }
}
'@
}