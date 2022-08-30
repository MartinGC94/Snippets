@{
    SnippetName="Argument Completer Scriptblock"
    Description="Basic scriptblock for argumentcompleters"
    Author="MartinGC94"

Snippet=@'
{
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    $TrimmedWord = $wordToComplete.Trim(("'",'"'))

    foreach ($Item in Get-NetAdapter -Name "$TrimmedWord*")
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