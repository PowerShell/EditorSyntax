function DownloadAtom {
    Write-Host "Downloading latest Atom release..."

    $Source      = "https://atom.io/download/windows_zip?channel=stable"
    $Destination = Join-Path . '\atom.zip'

    try {
        Invoke-WebRequest $Source -OutFile $Destination -ErrorAction Stop
    } catch {
        $PSCmdlet.ThrowTerminatingError($PSItem)
    }

    Write-Host "Atom download finished..."

    ExtractAtom
}

function ExtractAtom {
    Write-Host "Extracting Atom.zip"

    $ZipFile = Join-Path (Split-Path $PSScriptRoot -Parent) '\atom.zip'
    $OutPath = Resolve-Path .

    try {
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        [System.IO.Compression.ZipFile]::ExtractToDirectory($ZipFile, $OutPath)
    } catch {
        $PSCmdlet.ThrowTerminatingError($PSItem)
    }

    Write-Host "Atom extracted..."

    Remove-Item $ZipFile -Force

    Write-Host "Atom.zip deleted..."
}

function ParseJasmine ($String) {
    if ($String -match "^\s+at.*$") {
        ' '
        return
    }

    if ($_ -match "^\s+it.*$") {
        $_ -replace '^(\s+)(it)','$1[-] It'
        return
    }

    if ($_ -match "^\s+Expected.*$") {
        $x = $_ -replace '^(\s*)(Expected)(.*)\s(to equal .*)','$1$2$3%%$1$4'
        $x.Replace('%%',"`n  ")
        return
    }

    $_
}

function ExitWithCode {
    param (
        $ExitCode
    )

    $Host.SetShouldExit($exitcode)
    exit
}

function RunSpecs {
    Write-Host "Running specs..."

    $specpath = Join-Path . '\spec'

    if (Test-Path $specpath) {
      & "$script:ATOM_EXE_PATH" --test spec *>&1 | ForEach-Object { ParseJasmine $_ }
    } else {
        throw '.\spec\ not found.'
    }

    if ($LASTEXITCODE -ne 0) {
        if ($Env:APPVEYOR) {
            ExitWithCode -exitcode $LASTEXITCODE
        } else {
            throw "One or more tests failed."
        }
    }
}