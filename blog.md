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
- Search for logs with a specific error message:
("Error message here")
| where cluster in ("qasp-prod-cct-01", "qasf-prod-cct-01", "wata-prod-cct-01")

- Filter logs based on a specific time range:
_sourceCategory=kubernetes/CCT/OpenShift/DEV/01/WATA
deployment = "yourmodulenamehere-deployment-dev"
| where _messageTime > now() - 1d and _messageTime < now()

- Filter logs by log level (e.g., INFO, WARN, ERROR):
_sourceCategory=kubernetes/CCT/OpenShift/PROD/01/QASP
| where deployment = "yourmodulenamehere-deployment-dev"
| where _level="ERROR"

- 



Conclusion:
With Sumo Logic, you have a powerful tool at your disposal to efficiently search and analyze application logs. By using the provided commands and examples, you can gain valuable insights into your application's behavior, troubleshoot issues, and ensure optimal performance. Explore the full potential of Sumo Logic and make log analysis an integral part of your software development and operations workflows.
