### Mögliche Lösung: Filtern1

```powershell
 Get-Service | Where-Object -FilterScript {$PSItem.Name.Length -gt 15}
 ```