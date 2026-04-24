---
name: http-interaction-analyzer
description: Documents all urls called by the current .net 4.5 app.
allowed-tools: Powershell
model: sonnet
---

1. Run `.claude/skills/http-interaction-analyzer/Scripts/DocumentHttpClientMentions.ps1`. This will scan the project and create a results file.
2. Read the generated results at `.claude/skills/http-interaction-analyzer/Documentation/HttpClientMentions.md`. It will contain a table like this:

### Search Results for 'HttpClient'

| File Name | Line | Code Snippet | Full Path | Env variable used | Full Url | Request Dto Name | Response Dto Name | Observations |
|---|---|---|---|---|---|---|---|---|
| ExampleService.cs | 24 | `var client = new HttpClient();` | C:\Path\To\http-interaction-analyzer-poc\Services\ExampleService.cs | | | | | |

3. The script is only able to collect the fields: File Name, Line, Code Snippet and Full Path. Your task is to analyze the code and add the missing data. 
Sometimes finding the HttpClient usage is not enough to find the used url, in those cases document that in the "Observations" column.