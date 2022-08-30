@{
    SnippetName="Enum Bit flags"
    Description="Basic enum with flags"
    Author="MartinGC94"

Snippet=@'
[Flags()]
enum Animals^
{
    Dog    = 1
    Cat    = 2
    Bird   = 4
    Lizard = 8
}
#How to use:
# [Animals]5
# $SetFlags=[Animals]6
# $SetFlags.HasFlag([Animals]::Bird)
'@
}