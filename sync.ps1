while ($true) {
    Write-Host ""
    Write-Host "=== GitHub Auto Sync ===" -ForegroundColor Cyan

    git fetch origin

    $status = git status --porcelain

    if (-not [string]::IsNullOrWhiteSpace($status)) {
        Write-Host "Өзгеріс табылды. GitHub-қа жіберілуде..." -ForegroundColor Yellow

        git add .
        git commit -m "Auto sync"
        git push origin main

        Write-Host "GitHub-қа жіберілді!" -ForegroundColor Green
    }
    else {
        Write-Host "Өзгеріс жоқ." -ForegroundColor Gray
    }

    Write-Host "Келесі тексеріс 30 секундтан кейін..." -ForegroundColor DarkGray
    Start-Sleep -Seconds 30
}