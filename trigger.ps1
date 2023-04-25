$orgName = "your-organization-name"
$projectName = "your-project-name"
$personalAccessToken = "your-personal-access-token"

$uri = "https://dev.azure.com/$orgName/$projectName/_apis/build/builds?api-version=7.0"

$body = @{
    definition = @{
        id = "pipeline-definition-id"
    }
    parameters = '{
        "parameter-name": "parameter-value"
    }'
}

$headers = @{
    Authorization = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($personalAccessToken)")))
    'Content-Type' = 'application/json'
}

$response = Invoke-RestMethod -Uri $uri -Method Post -Headers $headers -Body ($body | ConvertTo-Json -Depth 10)

$response
