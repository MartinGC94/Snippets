@{
    SnippetName="ValidateDrive Attribute"
    Description="ValidateDrive Attribute example."
    Author="MartinGC94"
    CaretOffset=71

Snippet=@'
#Ensures the path is in either PSDrive.
[ValidateDrive("HKLM","HKCU")]
'@
}