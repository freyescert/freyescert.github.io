#BGInfo Install
New-Item -ItemType Directory -Force -Path C:\Powershell\Logs #Creating Log Directory
Start-Transcript -Path "C:\Powershell\logs\BgInfo_Installer__$(get-date -f MM-dd-yyyy).txt" #Creates Transcript for Auditing

if (Test-Path "C:\bginfo")
{ remove-item -path "C:\bginfo" -Recurse }

copy-item \\YourServer\Software\BGInfo -Destination C:\BgInfo -Recurse -Verbose

Set-ItemProperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -name "BgInfo" -value  "C:\bginfo\Bginfo.exe C:\bginfo\YourConfig.bgi /TIMER:0 /NOLICPROMPT" -Verbose

Write-Host BGInfo Installed -ForegroundColor Green -BackgroundColor Black

Stop-Transcript
