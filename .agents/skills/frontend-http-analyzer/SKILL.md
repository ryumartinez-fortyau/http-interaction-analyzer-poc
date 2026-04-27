---
name: frontend-http-analyzer
description: Documents all URLs called by frontend code using axios or fetch.
allowed-tools: Powershell
model: sonnet
---

1. Run `.claude/skills/frontend-http-analyzer/Scripts/DocumentFrontendHttpMentions.ps1`. This will produce a list of files that contain `axios` or `fetch` usage.
2. Read the generated file list at `.claude/skills/frontend-http-analyzer/Documentation/FrontendHttpMentions.md`.
3. Read each file listed and analyze the code to identify all outbound HTTP calls.
4. Produce the final documentation by writing the following table to `.claude/skills/frontend-http-analyzer/Documentation/FrontendHttpMentions.md`, replacing the file list:

### Search Results for 'axios' / 'fetch'

| File Name | Line | Code Snippet | Full Path | Env variable used | Full Url | Method | Request Dto Name | Response Dto Name | Observations |
|---|---|---|---|---|---|---|---|---|---|
| exampleService.js | 12 | `axios.get('/api/users')` | C:\Path\To\exampleService.js | | /api/users | GET | | | |

   - **Env variable used**: name of the env variable or config key if the URL is not hardcoded (e.g. `process.env.API_URL`, `import.meta.env.VITE_API_URL`).
   - **Full Url**: the resolved URL being called, if determinable from the code.
   - **Method**: HTTP method (GET, POST, PUT, DELETE, etc.).
   - **Request Dto Name**: the type or object sent in the request body, if any.
   - **Response Dto Name**: the type the response is mapped/destructured into, if any.
   - **Observations**: use this column when the URL cannot be determined from the code alone, or to note anything relevant.
