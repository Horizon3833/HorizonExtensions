function UnzipFiles{
    param(
        [string]$zipFile, [string]$outPath
    )
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipFile, $outPath)
}

function CreateDirectory {
    param (
        $DirectoryName
    )
    if(-not(Test-Path -Path $DirectoryName)){
        New-Item -ItemType directory -Path $DirectoryName
    }
    

    Write-Output Installing Extensions...
    Invoke-WebRequest
}