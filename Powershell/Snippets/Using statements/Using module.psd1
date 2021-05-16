@{
    SnippetName="Using Module"
    Description="Using Module statement."
    Author="MartinGC94"

Snippet=@'
using module Microsoft.PowerShell.Utility
using module "C:\Windows\System32\WindowsPowerShell\v1.0\Modules\Dism\Dism.psd1"
using module @{
    ModuleName="Microsoft.PowerShell.Utility"
    ModuleVersion="3.0.0"
}^
'@
}