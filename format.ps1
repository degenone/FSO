param (
    [Parameter()]
    [string]$Path = "**",
    [Parameter()]
    [switch]$Check
)

$prettier = Get-Command prettier -ErrorAction SilentlyContinue -ErrorVariable err
if ($prettier) {
    $glob = "$Path/*.{ts,tsx,js,jsx,css,md,html}"
    $mode = if ($Check) { "--check" } else { "--write" }
    & $prettier $glob $mode
} else {
    Write-Error $err
}