# Moves processed files from 00 Inbox into .sources, using .sources\ledger.csv.
# Only files whose SHA-256 matches a ledger row are moved. Everything else stays and is listed.
# Place this script in a .tools folder at the root of the vault.
$ErrorActionPreference = 'Stop'
$vault  = (Resolve-Path -LiteralPath (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path))).Path
$inbox  = Join-Path $vault '00 Inbox'
$ledger = Join-Path $vault '.sources\ledger.csv'
$sourcesRoot = (Join-Path $vault '.sources') + [IO.Path]::DirectorySeparatorChar

if (-not (Test-Path -LiteralPath $ledger)) { Write-Host "No ledger yet, nothing to file." -ForegroundColor Yellow; exit 0 }

$byHash = @{}
foreach ($r in Import-Csv -LiteralPath $ledger) { if ($r.sha256) { $byHash[$r.sha256.ToLower()] = $r } }

$files = Get-ChildItem -LiteralPath $inbox -Recurse -File -Force -ErrorAction SilentlyContinue
if (-not $files) { Write-Host "Inbox is empty." -ForegroundColor Green; exit 0 }

$moved = 0; $kept = @()
foreach ($f in $files) {
    $h = (Get-FileHash -LiteralPath $f.FullName -Algorithm SHA256).Hash.ToLower()
    if (-not $byHash.ContainsKey($h)) { $kept += $f.Name; continue }

    $dest = [IO.Path]::GetFullPath((Join-Path $vault $byHash[$h].source_path))
    if (-not $dest.StartsWith($sourcesRoot, [StringComparison]::OrdinalIgnoreCase)) {
        Write-Host "  SKIPPED, ledger path is outside .sources: $($f.Name)" -ForegroundColor Red
        $kept += $f.Name; continue
    }

    New-Item -ItemType Directory -Path (Split-Path -Parent $dest) -Force | Out-Null
    if (Test-Path -LiteralPath $dest) {
        $dh = (Get-FileHash -LiteralPath $dest -Algorithm SHA256).Hash.ToLower()
        if ($dh -eq $h) {
            Remove-Item -LiteralPath $f.FullName -Force
            Write-Host "  already in .sources, removed inbox copy: $($f.Name)"
            $moved++; continue
        }
        Write-Host "  CONFLICT, a different file is already at $dest, kept: $($f.Name)" -ForegroundColor Red
        $kept += $f.Name; continue
    }

    Move-Item -LiteralPath $f.FullName -Destination $dest
    Write-Host "  filed: $($f.Name)" -ForegroundColor Green
    $moved++
}

Get-ChildItem -LiteralPath $inbox -Recurse -Directory -Force | Sort-Object FullName -Descending |
    Where-Object { -not (Get-ChildItem -LiteralPath $_.FullName -Force) } | Remove-Item -Force

Write-Host "`nFiled $moved file(s)."
if ($kept) {
    Write-Host "Left in the inbox:" -ForegroundColor Yellow
    $kept | ForEach-Object { Write-Host "  $_" }
}
