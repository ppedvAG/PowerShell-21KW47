<#
.SYNOPSIS
    Kurzbeschreibung deines Skriptes
.DESCRIPTION
    Lange Beschreibung
#>
[cmdletBinding()]
param(

[Parameter(Mandatory=$true)]
[ValidateSet(4624,4625,4634)]
[int]$EventID,

[ValidateRange(5,10)]
[int]$Newest = 5,

[ValidateScript({Test-NetConnection -ComputerName -$PSITEM -CommonTCPPort WinRm -InformationLevel Quiet})]
[string]$ComputerName = "localhost"
)

Write-Verbose -Message "Das Skript wurde mit folgenden Werten gestartet:"
Write-Verbose -Message "$EventId | $Newest | $ComputerName" 

Get-EventLog -LogName Security -ComputerName $ComputerName | Where-Object EventID -eq $EventID | Select-Object -First $Newest
