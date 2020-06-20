@{
    SnippetName="Class"
    Description="Basic Powershell class"
    Author="MartinGC94"

Snippet=@'
class MyCustomType
{
   # Property with validate set
   [ValidateSet("val1", "Val2")]
   [string] $P1

   # Static property
   static [hashtable] $P2

   # Hidden property does not show as result of Get-Member
   hidden [int] $P3

   # Constructor
   MyCustomType ([string] $s)
   {
       $this.P1 = $s       
   }

   # Static method
   static [void] MemberMethod1([hashtable] $h)
   {
       [MyCustomType]::P2 = $h
   }

   # Instance method
   [int] MemberMethod2([int] $i)
   {
       $this.P3 = $i
       return $this.P3
   }
}^
'@
}