@{
    SnippetName="Argument Completer Scriptblock"
    Description="Basic scriptblock for argumentcompleters"
    Author="MartinGC94"

Snippet=@'
{
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    #Command or static items used for completion
    $ItemsToShow=Get-ChildItem -Path "C:\" | Where-Object -Property Name -Like "$wordToComplete*"

    foreach ($Item in $ItemsToShow)
    {
        $CompletionText = $Item.Name
        $ListItemText   = $Item.Name
        $ResultType     = [System.Management.Automation.CompletionResultType]::ParameterValue
        $ToolTip        = $Item.Name

        [System.Management.Automation.CompletionResult]::new($CompletionText,$ListItemText,$ResultType,$ToolTip)
    }
}^
'@
}