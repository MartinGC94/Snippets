function New-IseSnippet2
{
    [CmdletBinding()]
    param(

        [Parameter(Mandatory=$true, Position=0)]
        [String]
        $Title,
        
        [Parameter(Mandatory=$true, Position=1)]
        [String]
        $Description,
        
        [Parameter(Mandatory=$true, Position=2)]
        [String]
        $Text,

        [String]
        $Author,

        [Int32]
        [ValidateRange(0, [Int32]::MaxValue)]
        $CaretOffset = 0,

        [Switch]
        $Force,

        [string]
        $OutputDirectory
    )

    Begin
    {
        $CleanedText=$Text.Replace("`r",'')
        $snippetPath = $OutputDirectory
        
        if($CleanedText.IndexOf("]]>") -ne -1)
        {
            throw '{0} cannot contain the following sequence of characters: "{1}".' -f "Text","]]>"
        }

        if (-not (Test-Path $snippetPath))
        {
            $null = mkdir $snippetPath
        }
    }

    End
    {
        $snippet = @"
<?xml version='1.0' encoding='utf-8' ?>
    <Snippets  xmlns='http://schemas.microsoft.com/PowerShell/Snippets'>
        <Snippet Version='1.0.0'>
            <Header>
                <Title>$([System.Security.SecurityElement]::Escape($Title))</Title>
                <Description>$([System.Security.SecurityElement]::Escape($Description))</Description>
                <Author>$([System.Security.SecurityElement]::Escape($Author))</Author>
                <SnippetTypes>
                    <SnippetType>Expansion</SnippetType>
                </SnippetTypes>
            </Header>

            <Code>
                <Script Language='PowerShell' CaretOffset='$CaretOffset'>
                    <![CDATA[$CleanedText]]>
                </Script>
            </Code>

    </Snippet>
</Snippets>

"@

        $pathCharacters = '/\`*?[]:><"|.';
        $fileName=new-object text.stringBuilder
        for($ix=0; $ix -lt $Title.Length; $ix++)
        {
            $titleChar=$Title[$ix]
            if($pathCharacters.IndexOf($titleChar) -ne -1)
            {
                $titleChar = "_"
            }

            $null = $fileName.Append($titleChar)
        }

        $params = @{
            FilePath = "$snippetPath\$fileName.snippets.ps1xml";
            Encoding = "UTF8"
        }

        if ($Force)
        {
            $params["Force"] = $true
        }
        else
        {
            $params["NoClobber"] = $true
        }

        $snippet | Out-File @params
    }
}

$Data=Get-ChildItem -Path "$PSScriptRoot\Snippets" -Recurse -Filter *.psd1 | Import-PowerShellDataFile | ForEach-Object -Process {
    $CleanedSnippet=$_["Snippet"].Replace("`r",'')
    $CaretOffset=$CleanedSnippet.LastIndexOf('^')
    $CleanedSnippet=$CleanedSnippet.Remove($CaretOffset,1)
    $_["Snippet"]=$CleanedSnippet
    $_["CaretOffset"]=$CaretOffset
    [pscustomobject]$_
}

#Create ISE snippets
foreach ($Item in $Data)
{
    $IseSnippet=@{
        Title=$Item.SnippetName
        Description=$Item.Description
        Text=$Item.Snippet
        Author=$Item.Author
        CaretOffset=$Item.CaretOffset
        OutputDirectory="$PSScriptRoot\BuiltSnippets\ISE"
    }
    New-IseSnippet2 @IseSnippet -Force
}

#Create VS Code snippets
$VsCodeSnippets=@{}
foreach ($Item in $Data)
{
    $RawSnippet=$Item.Snippet
    $ModifiedSnippet=$RawSnippet.Replace('$','\$')

    $CaretOffset=$Item.CaretOffset+($ModifiedSnippet.Length - $RawSnippet.Length)
    $ModifiedSnippet=$ModifiedSnippet.Insert($CaretOffset,'$0')

    $Body=$ModifiedSnippet.Split("`n")

    $VsCodeSnippets.Add($Item.SnippetName,
        [pscustomobject]@{
            prefix=$Item.SnippetName
            body=$Body
            description=$Item.Description
        }
    )
}
[void](New-Item -Path "$PSScriptRoot\BuiltSnippets\VS Code" -ItemType Directory -Force)
[pscustomobject]$VsCodeSnippets | ConvertTo-Json | Out-File "$PSScriptRoot\BuiltSnippets\VS Code\PowerShell.json" -Encoding default -Force