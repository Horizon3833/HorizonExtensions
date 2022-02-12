$BinDir = "$Home\Desktop\HorizonExtensions"
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

Write-Host Installing Extensions...
Invoke-WebRequest $ZipUrl -OutFile "$BinDir/Extensions.zip"
Write-Host -ForegroundColor Green Installation Done!
Write-Host --------------------
Write-Host Extracting Files...

if (Get-Command Expand-Archive -ErrorAction SilentlyContinue) {
  Expand-Archive "$BinDir/Extensions.zip" -DestinationPath "$BinDir" -Force
}
else {
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  [IO.Compression.ZipFile]::ExtractToDirectory("$BinDir/Extensions.zip", $BinDir)
}

Remove-Item "$BinDir/Extensions.zip"
Write-Host -ForegroundColor Green Extraction Done!!!
Write-Host The Extensions are available at $BinDir\Extensions
Write-Host Thank You!!!