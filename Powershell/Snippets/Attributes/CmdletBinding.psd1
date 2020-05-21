@{
    SnippetName="CmdletBinding Attribute"
    Description="CmdletBinding Attribute example."
    Author="MartinGC94"
    CaretOffset=444

Snippet=@'
[CmdletBinding(
    PositionalBinding       = $true,
    DefaultParameterSetName = "ParameterSet1",
    SupportsShouldProcess   = $true,
    SupportsPaging          = $true,
    SupportsTransactions    = $true,
    ConfirmImpact           = [System.Management.Automation.ConfirmImpact]::Medium,
    HelpUri                 = "https://google.com",
    RemotingCapability      = [System.Management.Automation.RemotingCapability]::None
)]
'@
}