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

$pluginsFile = Join-Path $PSScriptRoot "claude\plugins.txt"
Get-Content $pluginsFile | ForEach-Object {
    $line = $_.Trim()
    if ($line -eq "" -or $line.StartsWith("#")) { return }
    Write-Host "claude $line"
    cmd /c "claude $line"
}
