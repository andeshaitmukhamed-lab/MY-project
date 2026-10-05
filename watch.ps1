$path = (Get-Location).Path

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $path
$watcher.Filter = "*.*"
$watcher.IncludeSubdirectories = $true
$watcher.NotifyFilter = [System.IO.NotifyFilters]::LastWrite

$action = {
    Start-Sleep -Seconds 3

    Write-Host ""
    Write-Host "Өзгеріс анықталды. GitHub-қа жіберілуде..." -ForegroundColor Yellow

    git add .
    git commit -m "Auto update"
    git push

    Write-Host "GitHub жаңартылды!" -ForegroundColor Green
}

Register-ObjectEvent -InputObject $watcher -EventName Changed -Action $action | Out-Null

$watcher.EnableRaisingEvents = $true

Write-Host "Автоматты GitHub бақылауы іске қосылды." -ForegroundColor Green
Write-Host "Файлды өзгертіп, Ctrl+S басыңыз."
Write-Host "Тоқтату үшін Ctrl+C."

while ($true) {
    Start-Sleep -Seconds 1
}