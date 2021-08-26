$keyPath = 'Registry::HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Main'
if (!(Test-Path $keyPath)) { New-Item $keyPath -Force | Out-Null }
Set-ItemProperty -Path $keyPath -Name "DisableFirstRunCustomize" -Value 1
New-Item -ItemType Directory -Force -Path C:\Temp\TV | Out-Null
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PremierITSupport/ProfileMigration/main/Migrate-WR2PREMIER.exe" -OutFile "C:\Temp\ForensIt\Migrate-WR2PREMIER.exe"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PremierITSupport/TV/main/TV_local_generic.bat" -OutFile "C:\Temp\TV\install.bat"
Start-Process cmd -argument "/c C:\Temp\TV\install.bat"