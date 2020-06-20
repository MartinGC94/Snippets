@{
    SnippetName="Switch Advanced"
    Description="Advanced switch."
    Author="MartinGC94"

Snippet=@'
switch -CaseSensitive -Exact -Regex -Wildcard ($x)
{
    'value1'
    {
    }
    {$_ -in 'A','B','C'}
    {
    }
    Default
    {
    }
}^
'@
}