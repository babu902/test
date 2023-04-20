    $uri = "$($env:SYSTEM_TEAMFOUNDATIONSERVERURI)$env:SYSTEM_TEAMPROJECTID/_apis/build/builds/$($env:BUILD_BUILDID)/changes?api-version=6.0"
    $response = Invoke-RestMethod -Uri $uri -Headers @{Authorization = "Bearer $env:SYSTEM_ACCESSTOKEN"} -Method Get
    $changedFiles = $response.value.filename | Where-Object { $_ -like '*base/*' -or $_ -like '*overlays/nonprod-appcert/*' }
    
   # Print the changed paths that match the paths.include section
    $includePaths = ('base/*','overlays/dev/*')
    $changedIncludePaths = $changedFiles | Where-Object { $_ -in $includePaths }
    if ($changedIncludePaths) {
      Write-Host "Changed paths in include section:"
      foreach ($path in $changedIncludePaths) {
        Write-Host $path
      }
    } else {
      Write-Host "No changed paths in include section."
    }
