@{
    SnippetName="DynamicParameterFull"
    Description="Example for defining a dynamic parameter block with 1 parameter."
    Author="MartinGC94"

Snippet=@'
DynamicParam
{
    #Dictionary that contains all dynamic parameters to show
    $DynamicParamsToShow = [System.Management.Automation.RuntimeDefinedParameterDictionary]::new()
    
    #region DynamicParameter1 definition
    $ParameterName="DynamicParameter1"
    $ParameterType=[string]
    $ParameterAttributes=[System.Collections.ObjectModel.Collection[System.Attribute]]::new()

    #Parameter attribute
    $Attribute=[System.Management.Automation.ParameterAttribute]::new()
    $Attribute.Mandatory=$true
    $Attribute.ParameterSetName="ParameterSet1"
    $ParameterAttributes.Add($Attribute)

    #Alias attribute
    $Attribute=[System.Management.Automation.AliasAttribute]::new("DP1")
    $ParameterAttributes.Add($Attribute)

    #Create dynamic parameter
    $Parameter=[System.Management.Automation.RuntimeDefinedParameter]::new($ParameterName, $ParameterType,$ParameterAttributes)
    #endregion

    #Check if a parameter is set, has a certain value, etc. before adding this dynamic parameter.
    if ($SomeCondition -eq $true)
    {
        $DynamicParamsToShow.Add($ParameterName,$Parameter)
    }


    return $DynamicParamsToShow
}^
'@
}