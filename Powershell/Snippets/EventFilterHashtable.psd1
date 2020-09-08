@{
    SnippetName="EventFilterHashtable"
    Description="Complete event log Hashtable filter"
    Author="MartinGC94"

Snippet=@'
@{
    LogName      = "System"
    ProviderName = "Microsoft-Windows-Kernel-General"
    Path         = "$env:windir\System32\Winevt\Logs\System.evtx"
    Keywords     = 128
    ID           = 12
    Level        = 4
    StartTime    = (Get-Date).AddDays(-2)
    EndTime      = (Get-Date)
    UserID       = "S-1-5-18"
    Data         = "BootMode", "0"
}^
'@
}