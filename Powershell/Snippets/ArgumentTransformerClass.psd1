@{
    SnippetName="ArgumentTransformerClass"
    Description="ArgumentTransformer class example"
    Author="MartinGC94"

Snippet=@'
class TimeZoneInfoTransformAttribute : System.Management.Automation.ArgumentTransformationAttribute 
{
    [System.Object] Transform([System.Management.Automation.EngineIntrinsics]$engineIntrinsics, [System.Object]$inputData)
    {
        if ($inputData -is [System.TimeZoneInfo])
        {
            return $inputData
        }

        $FoundTimeZone = foreach ($TimeZone in [System.TimeZoneInfo]::GetSystemTimeZones())
        {
            if ($inputData -eq $TimeZone.Id -or $inputData -eq $TimeZone.DisplayName)
            {
                $TimeZone
                break
            }
        }
        return $FoundTimeZone
    }
}
#How to use:
[TimeZoneInfoTransformAttribute()]^
'@
}