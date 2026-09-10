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

$nvimTarget = Join-Path $env:LOCALAPPDATA "nvim"
if (Test-Path $nvimTarget) {
    Write-Host "skip (already exists): nvim"
} else {
    cmd /c mklink /J "$nvimTarget" "$(Join-Path $PSScriptRoot 'nvim')" | Out-Null
    Write-Host "linked: nvim"
}

$pluginsFile = Join-Path $PSScriptRoot "claude\plugins.txt"
Get-Content $pluginsFile | ForEach-Object {
    $line = $_.Trim()
    if ($line -eq "" -or $line.StartsWith("#")) { return }
    Write-Host "claude $line"
    cmd /c "claude $line"
}

# ponytail statusline badge
# ponytail: resolves the plugin version at setup time (cmd can't glob at runtime like the
# bash side does), so re-run this script after a ponytail upgrade.
$settingsPath = Join-Path $env:USERPROFILE ".claude\settings.json"
$statusline = Get-ChildItem (Join-Path $env:USERPROFILE ".claude\plugins\cache\ponytail\ponytail\*\hooks\ponytail-statusline.ps1") -ErrorAction SilentlyContinue |
    Sort-Object Name | Select-Object -Last 1
if ($statusline) {
    $settings = if (Test-Path $settingsPath) { Get-Content $settingsPath -Raw | ConvertFrom-Json } else { [PSCustomObject]@{} }
    $value = [PSCustomObject]@{ type = "command"; command = "powershell -NoProfile -File `"$($statusline.FullName)`"" }
    $settings | Add-Member -NotePropertyName statusLine -NotePropertyValue $value -Force
    $settings | ConvertTo-Json -Depth 10 | Set-Content $settingsPath
    Write-Host "statusline: ponytail"
} else {
    Write-Host "statusline: skip (ponytail not installed)"
}
