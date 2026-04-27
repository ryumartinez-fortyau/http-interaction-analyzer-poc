# Resolve paths dynamically based on the script's location (.claude/skills/http-interaction-analyzer/Scripts)
$targetDirectory = [System.IO.Path]::GetFullPath("$PSScriptRoot/../../../../")
$exportFilePath = [System.IO.Path]::GetFullPath("$PSScriptRoot/../Documentation/HttpClientMentions.md")

$searchTerm = "HttpClient"

Write-Host "Searching for '$searchTerm' in $targetDirectory..." -ForegroundColor Cyan

$matchingFiles = Get-ChildItem -Path $targetDirectory -Recurse -Filter *.cs | Select-String -Pattern $searchTerm | Select-Object -ExpandProperty Path -Unique

if ($matchingFiles) {
    $markdownLines = @()
    $markdownLines += "### Files containing '$searchTerm'"
    $markdownLines += ""

    foreach ($file in $matchingFiles) {
        $markdownLines += "- $file"
    }

    $markdownLines | Set-Content -Path $exportFilePath -Encoding UTF8

    Write-Host "Done! Found $($matchingFiles.Count) file(s)." -ForegroundColor Green
    Write-Host "File list saved to: $exportFilePath" -ForegroundColor DarkGray
} else {
    Write-Host "No matches found for '$searchTerm'." -ForegroundColor Yellow
}
