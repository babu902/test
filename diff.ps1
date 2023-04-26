$organization = "<your-organization-name>"
$project = "<your-project-name>"
$repositoryId = "<your-repository-id>"
$commitId = "HEAD"

$url = "https://dev.azure.com/$organization/$project/_apis/git/repositories/$repositoryId/commits/$commitId/changes?api-version=7.0"

$headers = @{
    Authorization = "Bearer $env:SYSTEM_ACCESSTOKEN"
}

$response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get

foreach ($change in $response.changes) {
    $path = $change.item.path

    if ($path -like "overlays/dev/*" -or $path -like "overlays/sit/*") {
        $env = $path.Split("/")[1]
        Write-Output $env
    }
}
