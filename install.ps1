$BinDir = "$Home/Desktop/HorizonExtensions"
$ZipUrl = "https://github.com/Horizon3833/HorizonExtensions/releases/download/1.0/Extensions.zip"
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

function CreateDirectory {
    param (
          $DirectoryName
      )
      if (-not (Test-Path -Path $DirectoryName)) {
        New-Item -ItemType directory -Path $DirectoryName
      }
  }

CreateDirectory $BinDir

Write-Output Installing Extensions...
Invoke-WebRequest $ZipUrl -OutFile $BinDir
Write-Output -ForegroundColor Green Done!

Write-Output Extracting Files...
Unzip "$BinDir/Extensions.zip" "$BinDir/Extensions"
Remove-Item "$BinDir/Extensions.zip"
Write-Output -ForegroundColor Green Extraction Done!!!
Write-Output The Extensions are available at $BinDir/Desktop/HorizonExtensions/Extensions
Write-Output Thank You!!!