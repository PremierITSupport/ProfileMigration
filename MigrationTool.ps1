$keyPath = 'Registry::HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Main'
if (!(Test-Path $keyPath)) { New-Item $keyPath -Force | Out-Null }
Set-ItemProperty -Path $keyPath -Name "DisableFirstRunCustomize" -Value 1
New-Item -ItemType Directory -Force -Path C:\Temp\ForensiT | Out-Null
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PremierITSupport/ProfileMigration/main/Migrate-test27.exe" -OutFile "C:\Temp\ForensiT\Migrate-WR2PREMIER.msi"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PremierITSupport/ProfileMigration/main/ProfileMigration.bat" -OutFile "C:\Temp\ForensiT\install.bat"
Start-Process cmd -argument "/c C:\Temp\ForensiT\install.bat"

