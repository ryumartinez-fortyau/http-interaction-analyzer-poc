# Resolve paths dynamically based on the script's location
$targetDirectory = [System.IO.Path]::GetFullPath("$PSScriptRoot/../../../../")
$exportFilePath = [System.IO.Path]::GetFullPath("$PSScriptRoot/../Documentation/FrontendHttpMentions.md")

$searchTerms = @("axios", "fetch")
$extensions = @("*.js", "*.ts", "*.jsx", "*.tsx", "*.vue")

Write-Host "Searching for '$($searchTerms -join "', '")' in $targetDirectory..." -ForegroundColor Cyan

$matchingFiles = Get-ChildItem -Path $targetDirectory -Recurse -Include $extensions |
    Select-String -Pattern ($searchTerms -join "|") |
    Select-Object -ExpandProperty Path -Unique

if ($matchingFiles) {
    $markdownLines = @()
    $markdownLines += "### Files containing '$($searchTerms -join "' or '")'"
    $markdownLines += ""

    foreach ($file in $matchingFiles) {
        $markdownLines += "- $file"
    }

    $markdownLines | Set-Content -Path $exportFilePath -Encoding UTF8

    Write-Host "Done! Found $($matchingFiles.Count) file(s)." -ForegroundColor Green
    Write-Host "File list saved to: $exportFilePath" -ForegroundColor DarkGray
} else {
    Write-Host "No matches found." -ForegroundColor Yellow
}
