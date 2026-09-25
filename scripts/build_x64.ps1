[CmdletBinding()]
param(
    [ValidateSet("Debug", "Release", "RelWithDebInfo", "MinSizeRel")]
    [string]$Configuration = "Debug"
)

$ErrorActionPreference = "Stop"
$repositoryRoot = Split-Path -Parent $PSScriptRoot
$buildDirectory = Join-Path $repositoryRoot "build"

foreach ($tool in @("cmake", "ninja", "clang++")) {
    if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) {
        throw "Required build tool '$tool' was not found on PATH. Install it and retry."
    }
}

$compilerTarget = (& clang++ -dumpmachine).Trim()
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
if (-not $compilerTarget.StartsWith("x86_64-")) {
    throw "clang++ targets '$compilerTarget'; an x86_64 target is required."
}

$configureArgs = @(
    "-S", $repositoryRoot,
    "-B", $buildDirectory,
    "-G", "Ninja",
    "-DCMAKE_CXX_COMPILER=clang++",
    "-DCMAKE_BUILD_TYPE=$Configuration"
)

& cmake @configureArgs
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

& cmake --build $buildDirectory --config $Configuration
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
