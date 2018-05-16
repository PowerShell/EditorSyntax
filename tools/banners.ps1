function SyntaxBanner {
    Write-Host ' ______    _ _ _             _____             _             ' -ForegroundColor Green
    Write-Host '|  ____|  | (_) |           / ____|           | |            ' -ForegroundColor Green
    Write-Host '| |__   __| |_| |_ ___  _ _| (___  _   _ _ __ | |_ __ ___  __' -ForegroundColor Green
    Write-Host '|  __| / _` | | __/ _ \| ''__\___ \| | | | ''_ \| __/ _` \ \/ /' -ForegroundColor Green
    Write-Host '| |___| (_| | | || (_) | |  ____) | |_| | | | | || (_| |>  < ' -ForegroundColor Green
    Write-Host '|______\__,_|_|\__\___/|_| |_____/ \__, |_| |_|\__\__,_/_/\_\' -ForegroundColor Green
    Write-Host '                                    __/ |                    ' -ForegroundColor Green
    Write-Host '                                   |___/                     ' -ForegroundColor Green
}

function BuildBanner {
    Write-Host '#############################################################' -ForegroundColor Green
    Write-Host '#                       BUILD GRAMMAR                       #' -ForegroundColor Green
    Write-Host '#############################################################' -ForegroundColor Green
}

function TestBanner {
    Write-Host '#############################################################' -ForegroundColor Green
    Write-Host '#                         RUN TESTS                         #' -ForegroundColor Green
    Write-Host '#############################################################' -ForegroundColor Green
}

function EndBanner {
    Write-Host '#############################################################' -ForegroundColor Green
}
