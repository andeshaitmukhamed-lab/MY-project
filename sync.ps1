while ($true) {
    Write-Host ""
    Write-Host "=== GitHub Two-Way Sync ===" -ForegroundColor Cyan

    git fetch origin

    $localChanges = git status --porcelain
    $behind = git rev-list --count HEAD..origin/main
    $ahead = git rev-list --count origin/main..HEAD

    if (-not [string]::IsNullOrWhiteSpace($localChanges)) {
        Write-Host "Zhergilikti ozgeris tabyldy. GitHub-ka jiberilude..." -ForegroundColor Yellow

        git add .
        git commit -m "Auto sync"
        git push origin main

        Write-Host "GitHub zhanartyldy!" -ForegroundColor Green
    }
    elseif ($behind -gt 0) {
        Write-Host "GitHub-ta zhana ozgeris bar. Kompyuterge aly nuda..." -ForegroundColor Yellow

        git pull --ff-only origin main

        Write-Host "Kompyuter zhanartyldy!" -ForegroundColor Green
    }
    else {
        Write-Host "Ozgeris zhok. Eki zhak sinkhrondaldy." -ForegroundColor Gray
    }

    Write-Host "Kelesi tekseris 30 sekundtan keyin..." -ForegroundColor DarkGray

    Start-Sleep -Seconds 30
}