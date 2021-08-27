$keyPath = 'Registry::HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Main'
if (!(Test-Path $keyPath)) { New-Item $keyPath -Force | Out-Null }
Set-ItemProperty -Path $keyPath -Name "DisableFirstRunCustomize" -Value 1
New-Item -ItemType Directory -Force -Path C:\Temp\Migrate | Out-Null
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PremierITSupport/ProfileMigration/main/ProfileMigration0.bat" -OutFile "C:\Temp\Migrate\install.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PremierITSupport/ProfileMigration/main/Migrate-test27.exe" -OutFile "C:\Temp\Migrate\Migrate-test27.msi"
Start-Process cmd -argument "/c C:\Temp\Migrate\install.bat"