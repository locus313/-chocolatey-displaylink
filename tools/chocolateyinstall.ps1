$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"

$ID = '1371'
# $InitialURL = "https://www.displaylink.com/downloads/file?id=$ID"
# $Formdata = "fileId=$ID&accept_submit=Accept"

# $url = Get-WebLocation -URL $InitialURL -FormData $Formdata
$url = "https://www.synaptics.com/sites/default/files/exe_files/2022-04/DisplayLink%20USB%20Graphics%20Software%20for%20Windows10.2%20M2-EXE.exe"
$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  softwareName   = 'DisplayLink*'
  url            = $url
  checksum       = 'D9C7857417947249E253C38DF4CC7C55B535BDDE27EBDB24FAA83D747C0727F8'
  checksumType   = 'sha256'
  checksum64     = 'D9C7857417947249E253C38DF4CC7C55B535BDDE27EBDB24FAA83D747C0727F8'
  checksumType64 = 'sha256'
  silentArgs     = '-silent -noreboot -suppressUpToDateInfo'
  validExitCodes = @(0)
}

Install-ChocolateyZIPPackage @packageArgs
