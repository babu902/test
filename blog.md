# Logging Basics:

Before diving into Sumo Logic commands, let's quickly review some fundamental concepts related to logging:
Log Levels: Understanding different log levels (e.g., INFO, DEBUG, ERROR) and their significance in capturing different levels of detail.
Log Formats: Familiarize yourself with various log formats (e.g., JSON, plain text) and how Sumo Logic handles them.
Log Retention: Configuring log retention policies in Sumo Logic to manage log data storage.

# Basic Sumo Logic Commands:

Sumo Logic provides a set of essential commands to search and filter logs efficiently:
search: The primary command to search for logs based on specific keywords or patterns.
where: Narrowing down log search results by applying conditions, such as time range, log levels, or specific fields.
parse: Extracting structured data from log messages using regular expressions or field value mapping.
fields: Displaying or excluding specific fields in the log results.
sort: Sorting log results based on a particular field.
Advanced Sumo Logic Commands:
To gain deeper insights from your application logs, Sumo Logic offers advanced commands:
stats: Calculating statistical metrics (e.g., count, sum, average) based on log fields.
timechart: Generating time-based visualizations (e.g., line charts, bar charts) to analyze log data trends.
lookup: Enriching log data by performing lookups against external data sources (e.g., IP geolocation, user databases).
join: Combining log data from multiple sources based on common fields to perform correlation analysis.
extract: Creating new fields or modifying existing fields using regular expressions.

Log Parsing: Invest time in properly parsing your logs to extract structured data, enabling better search and analysis.
Index Optimization: Configure appropriate field indexing and metadata extraction to speed up log searches.
Query Optimization: Optimize your queries by specifying time ranges, applying filters, and using relevant commands to narrow down search results.
Regular Expression Mastery: Mastering regular expressions is crucial for advanced log parsing and data extraction.
Security and Access Control: Implement proper access controls and ensure sensitive log data is protected.

Sumo Logic URL:
To access Sumo Logic, navigate to the following URL for the North America instance:

URL: https://service.us2.sumologic.com/
Query to Retrieve Logs for a Specific Deployment:
To view logs for a specific deployment, use the following query:
_sourceCategory=kubernetes/CCT/OpenShift/DEV/01/WATA
deployment="yourmodulenamehere-deployment-dev"

Replace "yourmodulenamehere" with the actual name of your deployment.

Source Categories:
Source categories are an important best practice for organizing and categorizing logs in Sumo Logic. Here are some commonly used source categories:

Development Environment:
```
_sourceCategory=kubernetes/CCT/OpenShift/DEV/01/WATA
System Integration Testing (SIT) Environment:
_sourceCategory=kubernetes/CCT/OpenShift/SIT/01/WATA
User Acceptance Testing (UAT) Environment (QASP):
_sourceCategory=kubernetes/CCT/OpenShift/UAT/01/QASP
User Acceptance Testing (UAT) Environment (QASF):
_sourceCategory=kubernetes/CCT/OpenShift/UAT/01/QASF
Production Environment (QASP):
_sourceCategory=kubernetes/CCT/OpenShift/PROD/01/QASP
Production Environment (QASF):
_sourceCategory=kubernetes/CCT/OpenShift/PROD/01/QASF
```

Confirming Log Availability:
To confirm that your module logs are being captured, use a query specific to your deployment name. For example:
```
deployment="crru-service-deployment-dev"
```
Replace "crru-service-deployment-dev" with the actual name of your deployment.

Additional Query Examples:

Finding Logs for a Module:

Examples:
deployment="ctsg-deployment-dev"
deployment="parties-deployment-dev"
deployment="dealseries-deployment-dev"
Finding Things across a Cluster:

Find OS, JBoss Web Server, JDK, and Tomcat versions:
```
cluster="qasp-prod-cct-01" ("Server version name" or "OS Version" or "JVM Version" or "jws56-openjdk11-rhel8-openshift")
```

Finding Oracle Errors in Production Clusters:
```
(ORA-)
| where cluster in ("qasp-prod-cct-01", "qasf-prod-cct-01", "wata-prod-cct-01")
```

Finding Users and Their Roles:

Query to find user login events and extract the UPN (User Principal Name) and security role in parsed fields:
```
("Setting security context")
| where cluster in ("qasp-prod-cct-01", "qasf-prod-cct-01", "wata-prod-cct-01")
| parse "Authorities=[]" as roles
| parse "security.CTSUser()" as upn
```

Counting Logins per Module Grouped by Date:
```
("Setting security context")
| where cluster in ("qasp-prod-cct-01", "qasf-prod-cct-01", "wata-prod-cct-01")
| formatDate(_messageTime, "MM/dd/yyyy") as day
| count by container, day
| sort by day, _count
```

Analyzing Logs by Day, Hour, and Minute:
```
(javax.naming.NameNotFoundException)
| where cluster in ("qasp-prod-cct-01", "qasf-prod-cct-01", "wata-prod-cct-01")
| formatDate(_messageTime, "MM/dd/yyyy HH:mm") as day_hm
| count by container, day_hm
| sort by day_hm, _count
```
Conclusion:
With Sumo Logic, you have a powerful tool at your disposal to efficiently search and analyze application logs. By using the provided commands and examples, you can gain valuable insights into your application's behavior, troubleshoot issues, and ensure optimal performance. Explore the full potential of Sumo Logic and make log analysis an integral part of your software development and operations workflows.
