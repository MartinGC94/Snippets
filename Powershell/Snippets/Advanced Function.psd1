@{
    SnippetName="Advanced Function"
    Description="Template for a standard Advanced function"
    Author="MartinGC94"

Snippet=@'
function Verb-Noun^
{
    [CmdletBinding()]
    [OutputType([String])]
    Param
    (
        [Parameter()]
        [string[]]
        $Param1
    )

    Begin
    {
    }
    Process
    {
    }
    End
    {
    }
}
'@
}