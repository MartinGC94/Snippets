@{
    SnippetName="EventFilterXML"
    Description="Basic event log XML filter"
    Author="MartinGC94"

Snippet=@'
@"
<QueryList>
  <Query Id="0">
    <!--Get events from the System log-->
    <Select Path="System">
      <!--Get events from the Microsoft-Windows-Kernel-Boot provider-->
      *[System[Provider[@Name='Microsoft-Windows-Kernel-Boot'] and
      <!--Event ID 27 and a severity level greater than 3 (Warning)-->
      EventID=27 and Level &gt;3 and
      <!--Events logged within the last 24 hours.-->
      TimeCreated[timediff(@SystemTime) &lt;= $((New-TimeSpan -Hours 24).TotalMilliseconds)] and
      <!--basic or and nested example-->
      (Opcode=0 or Opcode=1 and Opcode!=2)]] and
      <!--BootType either has the value 0 or 2 and any Data field value contains a value below 3.-->
      *[EventData[(Data[@Name='BootType']=0 or Data[@Name='BootType']=2) and Data &lt;=3]]
    </Select>
  </Query>
</QueryList>
"@^
'@
}