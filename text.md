_sourceCategory=kubernetes/CCT/OpenShift/PROD/01/QASP
| where deployment = "yourmodulenamehere-deployment-dev"
| where _messageTime > now() - 1d and _messageTime < now()
