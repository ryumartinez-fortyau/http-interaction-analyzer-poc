---
name: dotnet-http-analyzer
description: Documents all urls called by the current .net 4.5 app.
allowed-tools: Powershell
model: sonnet
---

1. Run `.claude/skills/dotnet-http-analyzer/Scripts/DocumentHttpClientMentions.ps1`. This will produce a list of files that contain `HttpClient` usage.
2. Read the generated file list at `.claude/skills/dotnet-http-analyzer/Documentation/HttpClientMentions.md`.
3. Read each file listed and analyze the code to identify all outbound HTTP calls.
4. Produce the final documentation by writing the following table to `.claude/skills/dotnet-http-analyzer/Documentation/HttpClientMentions.md`, replacing the file list:

### Search Results for 'HttpClient'

| File Name | Line | Code Snippet | Full Path | Env variable used | Full Url | Method | Request Dto Name | Response Dto Name | Observations |
|---|---|---|---|---|---|---|---|---|---|
| ExampleService.cs | 24 | `client.GetAsync(...)` | C:\Path\To\ExampleService.cs | | https://example.com | GET | | | |

   - **Env variable used**: name of the config key or environment variable if the URL is not hardcoded.
   - **Full Url**: the resolved URL being called, if determinable from the code.
   - **Method**: HTTP method (GET, POST, PUT, DELETE, etc.).
   - **Request Dto Name**: the type sent in the request body, if any.
   - **Response Dto Name**: the type the response is deserialized into, if any.
   - **Observations**: use this column when the URL cannot be determined from the code alone, or to note anything relevant.
