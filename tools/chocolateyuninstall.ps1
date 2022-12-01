$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'kotlinc*'

  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1605, 1614, 1641) 
}
    
Uninstall-BinFile "$($packageArgs['packageName'])"
Uninstall-BinFile "$($packageArgs['packageName'])-js"
Uninstall-BinFile "$($packageArgs['packageName'])-jvm"

