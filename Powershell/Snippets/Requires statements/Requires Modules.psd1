@{
    SnippetName="Requires Modules"
    Description="Requires Modules statement."
    Author="MartinGC94"

Snippet=@'
#Requires -Modules "AzureRM.Netcore"
#Requires -Modules @{ ModuleName="AzureRM.Netcore"; ModuleVersion="0.12.0" }^
'@
}