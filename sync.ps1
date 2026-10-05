while ($true) {

    Write-Host ""
    Write-Host "=== GitHub синхронизациясы ===" -ForegroundColor Cyan

    # Алдымен GitHub-тағы өзгерістерді тексеру
    git fetch origin

    $status = git status --porcelain

    if ([string]::IsNullOrWhiteSpace($status)) {

        Write-Host "Жергілікті өзгеріс жоқ. GitHub-тан жаңартуды тексеру..." -ForegroundColor Gray

        git pull --ff-only origin main

    }
    else {

        Write-Host "Жергілікті өзгеріс анықталды. GitHub-қа жіберілуде..." -ForegroundColor Yellow

        git add .

        git commit -m "Auto sync"

        git push origin main
    }

    Write-Host "Келесі тексеру 5 секундтан кейін..." -ForegroundColor DarkGray

    Start-Sleep -Seconds 5
}