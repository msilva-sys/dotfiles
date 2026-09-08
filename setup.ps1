$repoSkills = Join-Path $PSScriptRoot "claude\skills"
$targetRoot = Join-Path $env:USERPROFILE ".claude\skills"
New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null

Get-ChildItem $repoSkills -Directory | ForEach-Object {
    $target = Join-Path $targetRoot $_.Name
    if (Test-Path $target) {
        Write-Host "skip (already exists): $($_.Name)"
    } else {
        cmd /c mklink /J "$target" "$($_.FullName)" | Out-Null
        Write-Host "linked: $($_.Name)"
    }
}
