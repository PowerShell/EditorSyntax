function DownloadAtom {
    Write-Host "Downloading latest Atom release..."

    $Source = "https://atom.io/download/windows_zip?channel=stable"
    $Destination = Join-Path . '\atom.zip'

    try {
        Invoke-WebRequest $Source -OutFile $Destination -ErrorAction Stop
    }
    catch {
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
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($PSItem)
    }

    Write-Host "Atom extracted..."

    Remove-Item $ZipFile -Force

    Write-Host "Atom.zip deleted..."
}

filter ParseJasmine {
    switch -regex ($_) {
        ^\s+at {
            ''
            break
        }

        ^\s+it {
            $_ -replace '^(\s+)(it)', '$1[-] It'
            break
        }

        ^\s+Expected {
            $_ -replace '^(\s*)(Expected.*?)\s(instead found .*)', "`$1`$2`n`$1`$3"
            break
        }

        default {
            $_
        }
    }
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
        & $script:ATOM_EXE_PATH --test $specpath *>&1 | ParseJasmine
    }
    else {
        throw '.\spec\ not found.'
    }

    if ($LASTEXITCODE -ne 0) {
        if ($Env:APPVEYOR) {
            ExitWithCode -exitcode $LASTEXITCODE
        }
        else {
            throw "One or more tests failed."
        }
    }
}
