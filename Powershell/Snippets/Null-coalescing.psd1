@{
    SnippetName="Null-coalescing operator"
    Description="Example of using the Null-coalescing operator."
    Author="MartinGC94"

Snippet=@'
#Assigns $SomeVariable the left value, unless it is null, in which case the right value is assigned.
^$SomeVariable=$SomeNullVariable ?? (ls C:\)

#Assigns $SomeVariable the output from the command if $SomeVariable is null
$SomeVariable ??= ls C:\
'@
}