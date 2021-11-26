### Mögliche Lösung
```powershell
Get-EventLog -LogName System | Select-Object -Last 10 | Export-Csv -Path C:\KursFiles\LabsLoesungen\07-export1.csv
```
**Hinweis:** Get-EventLog verwendet eine veraltete win32 Schnittstelle. Für produktive Abfrage sollte Get-WinEvent verwendet werden.