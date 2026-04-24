---
name: http-interaction-analyzer
description: Documents all urls called by the current .net 4.5 app.
allowed-tools: Powershell
model: sonnet
---

1. Run `DocumentHttpClientMentions.ps1` this will create a file named HttpClientMentions.md.
2. Check HttpClientMentions.md, it will contain a table like this:
### Search Results for 'HttpClient'

| File Name | Line | Code Snippet | Full Path | Env variable used | Full Url | Request Dto Name | Response Dto Name | Observations |
|---|---|---|---|---|---|---|---|---|
| ExampleService.cs | 24 | `var client = new HttpClient();` | C:\Path\To\Your\Solution\Services\ExampleService.cs | | | | | |

3. The script is only able to collect the fields: File Name, Line, Code Snippet and Full Path. Your task is to add the missing data.
Sometimes finding the HttpClient usage is not enough to find the used url, in those cases document that in the "Observations" column.