$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"

$ID = '1371'
$InitialURL = "https://www.displaylink.com/downloads/file?id=$ID"
$Formdata = "fileId=$ID&accept_submit=Accept"

$url = Get-WebLocation -URL $InitialURL -FormData $Formdata
$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  softwareName   = 'DisplayLink*'
  url            = $url
  checksum       = '49D97FB8D26D4B636CBD0F122C08297DEE51C1ACAC8F41EB4A7B18898EF0BACA'
  checksumType   = 'sha256'
  checksum64     = '49D97FB8D26D4B636CBD0F122C08297DEE51C1ACAC8F41EB4A7B18898EF0BACA'
  checksumType64 = 'sha256'
  silentArgs     = '-silent -noreboot -suppressUpToDateInfo'
  validExitCodes = @(0)
}

Install-ChocolateyZIPPackage @packageArgs
