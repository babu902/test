jobs:
- job: my_job
  steps:
  - script: echo "This job runs before MyOtherPipeline."
  - task: PowerShell@2
    inputs:
      targetType: 'inline'
      script: |
        $token = "$(System.AccessToken)"
        $url = "$(System.TeamFoundationCollectionUri)/$(System.TeamProject)/_apis/pipelines/$(my_other_pipeline)/runs?api-version=6.0-preview.1"

        do {
          Start-Sleep -s 10
          $response = Invoke-RestMethod -Uri $url -Method Get -Headers @{Authorization = "Bearer $token"}
          $status = $response.value[0].status
        } while ($status -in @('inProgress', 'notStarted'))

        if ($status -eq 'succeeded') {
          echo "MyOtherPipeline succeeded."
        } else {
          echo "MyOtherPipeline failed."
        }
  - script: echo "This job runs after MyOtherPipeline completes."
