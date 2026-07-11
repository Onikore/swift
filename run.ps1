# Compiles and runs a single Swift file.
# Usage: .\run.ps1 learning/01-basics/01_hello_world.swift
#
# Note: `swift file.swift` (interpreter mode) hits a JIT symbol-loading bug
# on this Windows toolchain build, so this always compiles with swiftc first.

param(
    [Parameter(Mandatory = $true)]
    [string]$File
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command swiftc -ErrorAction SilentlyContinue)) {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "User") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "Machine")
    $env:SDKROOT = [System.Environment]::GetEnvironmentVariable("SDKROOT", "User")
}

$resolved = Resolve-Path $File
$outExe = Join-Path $env:TEMP ((Get-Item $resolved).BaseName + ".exe")

swiftc $resolved -o $outExe
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

& $outExe
Remove-Item $outExe, ($outExe -replace '\.exe$', '.lib'), ($outExe -replace '\.exe$', '.exp') -ErrorAction SilentlyContinue
