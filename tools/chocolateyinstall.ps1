$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/JetBrains/kotlin/releases/download/v1.7.21/kotlin-compiler-1.7.21.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url

  softwareName  = 'kotlinc*'
  checksum      = '8412b31b808755f0c0d336dbb8c8443fa239bf32ddb3cdb81b305b25f0ad279e'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url $url `
  -UnzipLocation $toolsDir `
  -Checksum $checksum `
  -ChecksumType $checksumType

Install-BinFile "$($packageArgs['packageName'])" "..\lib\kotlinc\tools\kotlinc\bin\kotlinc.bat"
Install-BinFile "$($packageArgs['packageName'])-js" "..\lib\kotlinc\tools\kotlinc\bin\kotlinc-js.bat"
Install-BinFile "$($packageArgs['packageName'])-jvm" "..\lib\kotlinc\tools\kotlinc\bin\kotlinc-jvm.bat"
