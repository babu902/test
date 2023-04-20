# Set variables for your Azure DevOps organization, project, and pipeline
$org = "your-organization-name"
$project = "your-project-name"
$pipelineId = "your-pipeline-id"

# Set the URL for the Azure DevOps REST API endpoint for triggering a pipeline
$url = "https://dev.azure.com/$org/$project/_apis/pipelines/$pipelineId/runs?api-version=6.0-preview.1"

# Set the body of the POST request to specify any required parameters or variables for the pipeline
$body = @{
    resources = @{
        repositories = @{
            self = @{
                refName = "refs/heads/master"
            }
        }
    }
    templateParameters = @{
        parameterName = "parameterValue"
    }
}

# Convert the body to JSON format
$jsonBody = $body | ConvertTo-Json

# Set the authorization header using the system access token
$headers = @{
    Authorization = "Bearer $env:SYSTEM_ACCESSTOKEN"
}

# Send the HTTP POST request to trigger the pipeline
$response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $jsonBody
