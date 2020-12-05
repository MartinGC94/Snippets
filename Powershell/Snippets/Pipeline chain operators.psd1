@{
    SnippetName="Pipeline chain operators"
    Description="Example of using the pipeline chain operators."
    Author="MartinGC94"

Snippet=@'
^#Runs invoke-command if ping succeeds
[void](Test-Connection localhost) && Invoke-Command localhost {ls C:\}

#Runs invoke-command if ping fails
[void](Test-Connection localhost) || Invoke-Command localhost {ls C:\}

#Terminating errors will prevent the second command from running
[void](Test-Connection localhost -ErrorAction Stop) || Invoke-Command localhost {ls C:\}
'@
}