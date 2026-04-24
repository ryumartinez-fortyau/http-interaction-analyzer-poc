Here is the complete, consolidated `README.md` file including the future vision for the interaction graph.


# HTTP Interaction Analyzer (Claude Skill POC)

This Proof of Concept (POC) is a custom Claude Skill designed to automatically document outbound HTTP interactions within a .NET 4.5 codebase. 

Migrating or maintaining legacy applications often requires a clear map of external API calls. This tool leverages a PowerShell script to find usages of `HttpClient` and uses Claude's LLM capabilities to trace those usages back to their actual URLs, environment variables, and data transfer objects (DTOs).

## Directory Structure

The skill is built using the Claude custom skills structure:

```text
http-interaction-analyzer-poc/
├── .claude/
│   └── skills/
│       └── http-interaction-analyzer/
│           ├── Documentation/
│           │   └── HttpClientMentions.md       <-- Generated output file
│           ├── Scripts/
│           │   └── DocumentHttpClientMentions.ps1 <-- Search script
│           └── SKILL.md                        <-- Claude instructions/config
└── (Your .NET 4.5 Source Code)
```

## How It Works

This tool operates in a two-step hybrid workflow:

### 1. Discovery (PowerShell)
When the skill is triggered, Claude executes the `DocumentHttpClientMentions.ps1` script. 
* The script recursively scans the project for `.cs` files containing the string `"HttpClient"`.
* It extracts the file name, line number, code snippet, and absolute path.
* It generates a Markdown table skeleton in `Documentation/HttpClientMentions.md`.

### 2. Analysis & Enrichment (Claude LLM)
After the script finishes, Claude reads the generated `HttpClientMentions.md` file. 
* Claude uses the file paths to inspect the actual C# source code surrounding the `HttpClient` calls.
* It acts as an intelligent static analyzer, filling in the missing columns in the Markdown table:
  * **Env variable used:** Configuration keys used to build the base URL.
  * **Full Url:** The complete endpoint path being requested.
  * **Request Dto Name:** The C# object being serialized in the request body.
  * **Response Dto Name:** The C# object the response is being deserialized into.
  * **Observations:** Any edge cases or limitations (e.g., dynamically generated URLs that can't be fully resolved statically).

## Usage

Once configured in your Claude environment, you can simply ask Claude:

> *"Run the http-interaction-analyzer skill to document all API calls in this project."*

Claude will automatically run the script, read the results, analyze your source code, and update the markdown table with a comprehensive map of your application's external HTTP calls.

## Future Vision: Microservices Interaction Graph

This skill represents **Phase 1** of a broader initiative to automatically map and visualize dependencies across our entire distributed architecture.

Because modern systems are spread across multiple repositories, understanding the full web of communication can be challenging. The ultimate goal is to generate a comprehensive interaction graph.

### The Roadmap

* **Phase 1: Local Extraction (Current POC)**
  Deploy this `http-interaction-analyzer` skill to run locally on every individual microservice repository. This standardizes how outbound HTTP interactions are documented, resulting in a consistent `HttpClientMentions.md` artifact for each service.
  
* **Phase 2: Global Aggregation (Future Skill)**
  Create a second, higher-level Claude skill (e.g., `system-topology-mapper`). This skill will:
  1. Traverse the repositories and collect the `HttpClientMentions.md` files from all microservices.
  2. Use the aggregated data as context for the LLM.
  3. Map the Request/Response DTOs and URLs to identify which internal services are communicating with each other.
  4. Generate a visual representation of the architecture (such as a Mermaid.js diagram or PlantUML graph), effectively documenting the entire system's network topology automatically.
```