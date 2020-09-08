@{
    SnippetName="EventFilterXML"
    Description="Basic event log XML filter"
    Author="MartinGC94"

Snippet=@'
@"
<QueryList>

  <Query Id="0" Path="System">
    <Select Path="System">
      *[System[Provider[@Name='Microsoft-Windows-Kernel-Boot' or @Name='Microsoft-Windows-ActionQueue'] and
      <!--Log level. Supports 1-5. Critical,Error,Warning,Info,Show.-->
      Level=4 and
      EventID = 27 and
      <!--Events logged within the last 24 hours.-->
      TimeCreated[timediff(@SystemTime) &lt;= $((New-TimeSpan -Hours 24).TotalMilliseconds)]]] and
      <!--Event specific data.-->
      *[EventData[Data[@Name='BootType'] and (Data='0')]]
    </Select>
  </Query>

</QueryList>
"@^
'@
}