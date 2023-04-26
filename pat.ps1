# Set your Azure DevOps organization name, project name, and repo name
$organizationName = "your-org-name"
$projectName = "your-project-name"
$repoName = "your-repo-name"

# Set the maximum number of commits to retrieve
$top = 1

# Set the REST API endpoint to get the latest commit
$uri = "https://dev.azure.com/$organizationName/$projectName/_apis/git/repositories/$repoName/commits?searchCriteria.$top=$top&api-version=7.0"

# Create an Azure DevOps REST API authentication header using a Personal Access Token (PAT)
$pat = "your-pat"
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$pat"))
$headers = @{
    Authorization = "Basic $base64AuthInfo"
}

# Invoke the Azure DevOps REST API to get the latest commit
$response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get

# Get the commit ID for the latest commit
$commitId = $response.value.commitId

# Set the maximum number of changes to retrieve
$top = 1000

# Set the number of changes to skip
$skip = 0

# Set the REST API endpoint to get the list of changes for the latest commit
$uri = "https://dev.azure.com/$organizationName/$projectName/_apis/git/repositories/$repoName/commits/$commitId/changes?top=$top&skip=$skip&api-version=7.0"

# Invoke the Azure DevOps REST API to get the list of changes for the latest commit
$response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get

# Print the list of changed files
Write-Host "The following files were changed in the latest commit ($commitId):"
foreach ($change in $response.value) {
    Write-Host $change.item.path
}
