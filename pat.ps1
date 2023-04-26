# Set your Azure DevOps organization name, project name, and repo name
$organizationName = "your-org-name"
$projectName = "your-project-name"
$repoName = "your-repo-name"

# Set the personal access token (PAT) for your Azure DevOps account
$pat = "your-pat"

# Set the branch to search for changes
$branch = "main"

# Set the REST API endpoint to get the latest commit for the specified branch
$uri = "https://dev.azure.com/$organizationName/$projectName/_apis/git/repositories/$repoName/commits?branch=$branch&$top=1&api-version=7.0"

# Create an Azure DevOps REST API authentication header using your PAT
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($pat)"))
$headers = @{
    Authorization = "Basic $base64AuthInfo"
}

# Invoke the Azure DevOps REST API to get the latest commit for the specified branch
$response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get

# Get the latest commit ID from the response
$latestCommitId = $response.value.commitId

# Set the REST API endpoint to get the list of changes for the latest commit
$uri = "https://dev.azure.com/$organizationName/$projectName/_apis/git/repositories/$repoName/commits/$latestCommitId/changes?api-version=7.0"

# Invoke the Azure DevOps REST API to get the list of changes for the latest commit
$response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get

# Print the list of changed files
Write-Host "The following files were changed in the latest commit:"
foreach ($change in $response.value) {
    Write-Host $change.item.path
}
