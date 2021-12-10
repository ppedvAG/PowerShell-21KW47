[cmdletBinding()]
param(

[ValidateScript({Test-Path -Path $PSItem})]
[Parameter(Mandatory=$true)]
[string]$Destinationpath,

[ValidateRange(1,100)]
[int]$FileCount = 9,

[Validatelength(5,20)]
[string]$FileName = "File",

[switch]$Force
)

for($i = 1; $i -le $FileCount; $i++)
{
    $Name = $FileName + ("{0:D3}" -f $i) + ".txt"
    if(Test-Path -Path "$Destinationpath\$Name")
    {
        Write-Error
        exit
    }
    New-Item -Path $Destinationpath -Name $Name -ItemType File -Force:$Force

    
}