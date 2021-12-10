### Mögliche Lösung: Pipeline 2


## Möglichkeit 1
```powershell
Import-Csv -Path C:\Testfiles\MyNewAdUsers1.csv | New-ADUser
```
Problem ist aber das die User deaktiviert angelegt werden da der New-ADUser Passwörter nur als SecureString akzeptiert.

## Möglichkeit 2
Durch die Verwendung von Foreach ist es möglich den String in einen Securestring zu konvertieren und den Enabled Wert von einem string in einen Boolean (true/false) zu konvertieren.
```powershell
Import-Csv -Path C:\Testfiles\MyNewAdUsers2.csv | ForEach-Object -Process {
            New-ADUser -GivenName $_.GivenName `
                       -Surname $_.GivenName `
                       -Name $_.Name `
                       -SamAccountName $_.SamAccountName `
                       -Department $_.Department `
                       -Path $_.Path `
                       -Enabled ([bool]::Parse($_.Enabled)) `
                       -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -Force)
}
```
