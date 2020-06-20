@{
    SnippetName="ValidatePattern Attribute"
    Description="ValidatePattern Attribute example."
    Author="MartinGC94"

Snippet=@'
[ValidatePattern('\w',Options=[System.Text.RegularExpressions.RegexOptions]::CultureInvariant)]^
'@
}