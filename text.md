_sourceCategory=kubernetes/CCT/OpenShift/PROD/01/QASP
| where deployment = "yourmodulenamehere-deployment-dev"
| parse regex "ERROR: (?<errorMessage>.+)"
| count by errorMessage

_sourceCategory=kubernetes/CCT/OpenShift/PROD/01/QASP | where _timestamp > "yyyy-mm-ddTHH:MM:SS" and _timestamp < "yyyy-mm-ddTHH:MM:SS"

_sourceCategory=kubernetes/CCT/OpenShift/PROD/01/QASP | timeslice 1d | where (_message contains "error" or _message contains "exception")

_sourceCategory=kubernetes/CCT/OpenShift/PROD/01/QASP | timeslice 1d | where (_message contains "error" or _message contains "exception") and (_message contains "application" or _message contains "server")

_sourceCategory=kubernetes/CCT/OpenShift/PROD/01/QASP
| timeslice 1h
| count by _timeslice
| sort by _timeslice asc
| linechart

_sourceCategory=kubernetes/CCT/OpenShift/PROD/01/QASP
| parse "Response time: *ms" as response_time
| avg(response_time) as avg_response_time

_sourceCategory=kubernetes/CCT/OpenShift/PROD/01/QASP
| where _timestamp > "yyyy-mm-ddTHH:MM:SS" and _timestamp < "yyyy-mm-ddTHH:MM:SS"

