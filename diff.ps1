# Get the paths that have changed
$changedPaths = git diff --name-only HEAD HEAD~1 | Where-Object { $_ -like 'overlays/dev/*' -or $_ -like 'overlays/sit/*' }

# Extract the environment from the changed paths
$environments = $changedPaths | ForEach-Object { (Split-Path $_ -Parent).Split("\")[-1] }

# Extract the environment name from the path
$envNames = $environments | ForEach-Object { $_.Split("\")[-1] }

# Print the changed paths and their environments
if ($envNames) {
  Write-Host "Changed paths in include section:"
  foreach ($env in $envNames) {
    Write-Host $env
  }

  # Push the environment variable value to a variable group using Azure CLI
  az pipelines variable-group variable create --group-id <variable-group-id> --name ENVIRONMENT_NAME --value $envNames
} else {
  Write-Host "No changed paths in include section."
}
