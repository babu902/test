_sourceCategory=kubernetes/CCT/OpenShift/PROD/01/QASP
| where deployment = "yourmodulenamehere-deployment-dev"
| parse regex "ERROR: (?<errorMessage>.+)"
| count by errorMessage
