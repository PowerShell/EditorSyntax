# incorrect syntax highlight in parameter type
# https://github.com/PowerShell/EditorSyntax/issues/56
function Issue56 {
    param(
        # Credentials to use to connect to JIRA.
        [Parameter(
            Position = 0,
            Mandatory = $true
        )]
        [System.Management.Automation.PSCredential] $Credential,

        [String] $CertificateThumbprint,

        [X509Certificate] $Certificate
    )
}

# Incorrect coloring of PowerShell call operator line with "#" character in arguments
# https://github.com/PowerShell/EditorSyntax/issues/55
& $oscdimg -m -o -u2 -udfver102 -bootdata:2#p0,e,b$isoPath\boot\etfsboot.com#pEF,e,b$isoPath\efi\microsoft\boot\efisys.bin $isoPath $outputPath

# Operator vs. Parameter Color Coding Issue
# https://github.com/PowerShell/EditorSyntax/issues/54
$x = 100000
$EmailList = For ($i=0;$i -lt $x;$i++) {
"$(Get-RandomString -length 10)@$(Get-RandomString -length 10).com"
}
$EmailList | Set-Content -Path .\file1.txt

# Inconsistency for coloring between splatting and functions
# https://github.com/PowerShell/EditorSyntax/issues/52
$SelectParams = @{
    Property = 'ProcessName'
    Verbose  = $true
}

$SelectParams.ErrorAction = 'Stop'

Get-Process | Select-Object -Property ProcessName
Get-Process | Select-Object @SelectParams

# Coloring error in ValidateSet()
# https://github.com/PowerShell/EditorSyntax/issues/51
function Issue51 {
    param (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Production','Test','Dev, or Edu')]
        [System.String]
        $SupportLevel
    )
}

# Syntax highlighting for variables incorrect where ? is treated as token separator
# https://github.com/PowerShell/EditorSyntax/issues/49
# https://github.com/PowerShell/EditorSyntax/issues/40
$foo?bar = 1
"$foo?bar"
${foo?bar}
"${foo?bar}"
"https://www.googleapis.com/drive/v3/teamdrives/$TeamDriveID?fields=capabilities%2Cid%2Ckind%2Cname"

# "Process" keyword is incorrectly highlighted in New-Object -TypeName System.Diagnostics.Process
# https://github.com/PowerShell/EditorSyntax/issues/47
New-Object -TypeName System.Diagnostics.Process -Property @{  }

# .bat & .exe Syntax Highlighting Error
# https://github.com/PowerShell/EditorSyntax/issues/46
ipconfig.exe
Import-Module AzureRM.Backup
Import-Module AzureRm.Batch
Import-Module AzureRm.Exefake
Import-Module AzureRM.Cdn

# Where-Object command is not properly highlighted
# https://github.com/PowerShell/EditorSyntax/issues/45
# https://github.com/PowerShell/EditorSyntax/issues/39
Get-Process |
    Where-Object -FilterScript { $PSItem.Name -eq 'System' } |
    ForEach-Object -Process { $PSItem.WorkingSet }

Get-AzureVMImage `
| where ImageFamily -eq $imageFamily `
| sort PublishedDate -Descending `
| select -ExpandProperty ImageName -First 1

Get-AzureVMImage `
| Where-Object ImageFamily -eq $imageFamily `
| Sort-Object PublishedDate -Descending `
| Select-Object -ExpandProperty ImageName -First 1

# Class keyword is incorrectly colored when used as a parameter
# https://github.com/PowerShell/EditorSyntax/issues/43
function Test-Function {
    [CmdletBinding()]
    param (
      [string] $Class
    )
  }

### Notice the blue color of "Class", indicating that it is a reserved language keyword.
Test-Function -Class asdf

### Notice how the "-Name" parameter is colored differently than "-Class" above
Get-Process -Name asdf

# Discrepancy in Syntax coloring of some cmdlets in VSCode
# https://github.com/PowerShell/EditorSyntax/issues/42
# https://github.com/PowerShell/EditorSyntax/issues/39
Register-WmiEvent -Class Win32_DeviceChangeEvent
Wait-Event -OutVariable Event | Out-Null
$Event.SourceArgs.newevent | `
Sort-Object TIME_CREATED -Descending | `
Select-Object EventType -ExpandProperty EventType -First 1

# variable naming syntax coloration
# https://github.com/PowerShell/EditorSyntax/issues/38
function MainBillingExcel($clients) {
    $clientws2 = $WB2.worksheets | where {$_.cells.item(2,1).value2 -like "*$clients*"}
}

# Syntax coloring issue with regex
# https://github.com/PowerShell/EditorSyntax/issues/37
function Get-ServerDomain {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true,
                   ValueFromPipelineByPropertyName = $true,
                   Position = 0)]
        [ValidateScript({$_ -match '^([\d\w]+\.){2,3}[\d\w]+$'})]
        [string]$Name
    )
    try {
        Write-Verbose "Splitting $Name"
        $domain = $Name.Split('.')[1]
        Write-Verbose $domain
        Return $domain
    }
    catch {}
}

# ValidatePattern breaking Syntax Highlighting
# https://github.com/PowerShell/EditorSyntax/issues/34
# https://github.com/PowerShell/EditorSyntax/issues/33
# https://github.com/PowerShell/EditorSyntax/issues/32
# https://github.com/PowerShell/EditorSyntax/issues/26
# https://github.com/PowerShell/EditorSyntax/issues/17
[ValidatePattern("^(\{){0,1}[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}(\}){0,1}$")]
[Parameter(ParameterSetName='mac')][ValidatePattern("([a-zA-Z0-9]{2}:){5}[a-zA-Z0-9]{2}")]
[ValidatePattern('^[A-Fa-f0-9]{8}-([A-Fa-f0-9]{4}-){3}[A-Fa-f0-9]{12}$')]

# Comments on same line as Function not styled when opening brace is on next line
# https://github.com/PowerShell/EditorSyntax/issues/30
Function New-Function { #comment here
}
Function New-Function #comment here
{
}

# Enumeration support
# https://github.com/PowerShell/EditorSyntax/issues/29
enum test
{
    listItem1
    listItem2
    listItem3
}

# Incorrect syntax highlighting for numeric digits in type names
# https://github.com/PowerShell/EditorSyntax/issues/28
[Microsoft.Win32.RegistryKey]::Equals()

# Syntax coloring doesn't recognize quoted strings in parameter validation attribute
# https://github.com/PowerShell/EditorSyntax/issues/27
function Publish-DscResource
{
    [OutputType([void])]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({
            if (-not (Get-DscResource -Name $_ -ErrorAction Ignore)) {
                throw "The DSC resource [$($_)] was not found"
            } else {
                $true
            }
        })]
        [string]$Name
    )
}

# Where/Foreach-object breaks syntax hightlighting
# https://github.com/PowerShell/EditorSyntax/issues/24
$SomeComputer = 'localhost'
$RemoteServicePS = @{
  'VMware' = @{
    'Service' = $(get-service -verbose:$false -computername $SomeComputer -displayName 'VMware Tools');
    'EndpointContracts' = @('ISimService','IServiceBroker');
    'Identity' = ''; #comment
    };
  }
$ServicesToSkip = @()

$RemoteServiceCIM = @{}; $HasServicePrincipalNames = @{}
$RemoteServicePS.GetEnumerator() | % { #comment
  $thisServiceKey = $_.Key # test
  if ($_.Value.Service -ne $null){

    $thisCIMService = $(get-ciminstance win32_service -verbose:$false -computername $_.Value.Service.MachineName -filter "name='$($_.Value.Service.ServiceName)'")
    $thisCIMServiceUser = $thisCIMService.StartName
    write-host $thisCIMServiceUser
    # etc.
  }
}

# After updating language-powershell to the most recent release the following from the code above breaks code highlighting for me:
$thisCIMService = $(get-ciminstance win32_service -verbose:$false -computername $_.Value.Service.MachineName -filter "name='$($_.Value.Service.ServiceName)'")

# The same also appears to be the case for the following little snippet (code hightlighting continues as before if commented out):
$thisBitVersionMatches = $FilesPresent | where {$_.FullName -match "^(?=.*$thisVersion)((?=.*$thisBitness)|(?=.*$thisSupportBit))(?=.*redist).*$"}

foreach ($Tool in $Tools){
    $ToolFromWhere.Keys | % {
      if (($_ -match $Tool) -and -not ($ToolsToDownload -contains $ToolFromWhere."$($_)")){
        write-verbose ('Fetching {0} from {1}' -f $_, $ToolFromWhere."$($_)")
        $ToolsToDownload += $ToolFromWhere."$($_)"
        [URI]$thisURI = $ToolFromWhere."$($_)"
        $thisFileName = $thisURI.Segments[-1]
        $thisTempFile = join-path -path $env:TEMP -childpath $thisFileName
        start-bitstransfer -source $thisURI -destination $thisTempFile
      }
    }
}

Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse |
Get-ItemProperty -name Version,Release -EA 0 |
    Where { $_.PSChildName -match '^(?!S)\p{L}'} |
    Select PSChildName, Version, Release, @{
        name="Product"
        expression={
            switch($_.Release) {
                DEFAULT {}
            }
        }
    }

# Where-Object is not highlighted correctly
# https://github.com/PowerShell/EditorSyntax/issues/22
function Clear-JunctionLinks {
    [CmdletBinding()]
    param (
    )

    Get-ChildItem -Path $env:TEMP -Directory | Where-Object -FilterScript { }
}

# Syntax highlighting doesn't recognize '#text' property
# https://github.com/PowerShell/EditorSyntax/issues/21
$_.'#text'.Trim()
Get-SomeXml |
Select-Object -ExpandProperty Node |
        % { if ($_.'#text') { $_.'#text'.Trim() -split ',\s*' }
            else            { @() }
        }

# Improper syntax highlighting for #requires statement
# https://github.com/PowerShell/EditorSyntax/issues/20
#requires -runasadministrator
#requires -modules servermanager
#Requires -Modules PSWorkflow, @{ModuleName="PSScheduledJob";ModuleVersion="1.0.0.0"}
#requires -version 5.0

# Are there Powershell flag highlighting inconsistencies?
# https://github.com/PowerShell/EditorSyntax/issues/18
Install-ConfigFiles -from "$here\tests\process" -to "$here"

# Syntax highlighting getting worse?
# https://github.com/PowerShell/EditorSyntax/issues/16
$Whatever.Name -match "Id"
$Whatever.Name -match ".*Id"

# Dot notation broken inside parens.
# https://github.com/PowerShell/EditorSyntax/issues/15
if ($Host.name -eq 'ConsoleHost')
{
    if (! (Get-Item ENV:VSCODE_PID -ErrorAction SilentlyContinue))
    {
        ## Set Location
        Set-Location -Path Repo:
    }
}

# Comma and Periods break Highlighting inside of Quotes.
# https://github.com/PowerShell/EditorSyntax/issues/14
if ($ModuleResults)
{
    if ($ModuleResults.Installed -ne $null)
    {
        Write-Host "[INFO] " -ForegroundColor DarkMagenta -NoNewline
        Write-Host "Installed Modules: "  -NoNewLine -ForegroundColor Gray
        Write-Host "$($ModuleResults.Installed -join ', ')" -ForegroundColor DarkGray
    }

    if ($ModuleResults.Updated -ne $null)
    {
        Write-Host "[INFO] " -ForegroundColor DarkMagenta -NoNewline
        Write-Host "Updated Modules: " -NoNewLine -ForegroundColor Gray
        Write-Host "$($ModuleResults.Updated -join ', ')" -ForegroundColor DarkGray
    }

    if ($ModuleResults.FailedUpdate -ne $null)
    {
        Write-Host "[Error] " -ForegroundColor Red -NoNewline
        Write-Host "Module Update Failed: " -NoNewLine -ForegroundColor Gray
        Write-Host "$($ModuleResults.FailedUpdate -join ', ')" -ForegroundColor DarkGray
    }

    if ($ModuleResults.FailedInstall -ne $null)
    {
        Write-Host "[ERROR] " -ForegroundColor Red -NoNewline
        Write-Host "Module Install Failed: " -NoNewLine -ForegroundColor Gray
        Write-Host "$($ModuleResults.FailedInstall -join ', ')" -ForegroundColor DarkGray
    }
}