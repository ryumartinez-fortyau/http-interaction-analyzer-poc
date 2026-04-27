### Search Results for 'HttpClient'

| File Name | Line | Code Snippet | Full Path | Env variable used | Full Url | Request Dto Name | Response Dto Name | Observations |
|---|---|---|---|---|---|---|---|---|
| ExternalController.cs | 9 | `private static readonly HttpClient _httpClient = new HttpClient();` | C:\mvc5example-master\Customer_List\Controllers\ExternalController.cs | | | | | Static field declaration. Not an HTTP call itself. |
| ExternalController.cs | 13 | `var response = await _httpClient.GetAsync("https://example.com");` | C:\mvc5example-master\Customer_List\Controllers\ExternalController.cs | | https://example.com | | | GET request. URL is hardcoded. Response read as raw string via `ReadAsStringAsync()` — no typed DTO used. |
| ExternalControllerA.cs | 9 | `private static readonly HttpClient _a = new HttpClient();` | C:\mvc5example-master\Customer_List\Controllers\ExternalControllerA.cs | | | | | Static field declaration. Not an HTTP call itself. |
| ExternalControllerA.cs | 13 | `var response = await _a.GetAsync("https://example.com");` | C:\mvc5example-master\Customer_List\Controllers\ExternalControllerA.cs | | https://example.com | | | GET request. URL is hardcoded. Response read as raw string via `ReadAsStringAsync()` — no typed DTO used. |
