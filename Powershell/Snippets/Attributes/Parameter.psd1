@{
    SnippetName="Parameter Attribute"
    Description="Parameter Attribute example."
    Author="MartinGC94"
    CaretOffset=409

Snippet=@'
[Parameter(
    Position                        = 0,
    ParameterSetName                = "ParameterSet1",
    Mandatory                       = $true,
    ValueFromPipeline               = $true,
    ValueFromPipelineByPropertyName = $true,
    ValueFromRemainingArguments     = $true,
    HelpMessage                     = "Mandatory help message.",
    DontShow                        = $false
)]
'@
}