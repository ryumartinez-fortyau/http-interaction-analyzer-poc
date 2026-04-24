# Resolve paths dynamically based on the script's location (.claude/skills/http-interaction-analyzer/Scripts)
$targetDirectory = [System.IO.Path]::GetFullPath("$PSScriptRoot\..\..\..\..")
$exportFilePath = [System.IO.Path]::GetFullPath("$PSScriptRoot\..\Documentation\HttpClientMentions.md")

$searchTerm = "HttpClient"

Write-Host "Searching for '$searchTerm' in $targetDirectory..." -ForegroundColor Cyan

# Perform the search
$results = Get-ChildItem -Path $targetDirectory -Recurse -Filter *.cs | Select-String -Pattern $searchTerm

# Check if we found anything
if ($results) {
    # Initialize an array to hold the markdown lines
    $markdownLines = @()

    # Add the title and table headers including the new Observations column
    $markdownLines += "### Search Results for '$searchTerm'"
    $markdownLines += ""
    $markdownLines += "| File Name | Line | Code Snippet | Full Path | Env variable used | Full Url | Request Dto Name | Response Dto Name | Observations |"
    $markdownLines += "|---|---|---|---|---|---|---|---|---|"

    # Process each match and format it as a markdown table row
    foreach ($match in $results) {
        $fileName = $match.Filename
        $lineNumber = $match.LineNumber
        $fullPath = $match.Path

        # Trim whitespace and escape pipe characters to prevent breaking the table
        $cleanSnippet = $match.Line.Trim() -replace '\|', '&#124;'

        # Construct the row with one more empty cell at the end
        $markdownLines += "| $fileName | $lineNumber | `$cleanSnippet` | $fullPath | | | | | |"
    }

    # Write the array to the markdown file
    $markdownLines | Set-Content -Path $exportFilePath -Encoding UTF8

    Write-Host "Done! Found $($results.Count) matches." -ForegroundColor Green
    Write-Host "Markdown table saved to: $exportFilePath" -ForegroundColor DarkGray
} else {
    Write-Host "No matches found for '$searchTerm'." -ForegroundColor Yellow
}
