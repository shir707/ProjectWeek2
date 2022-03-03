param(
    [Parameter(Mandatory)]
    [String]$f
)
$password = Get-Content -Path $f
if ($password.length -lt 10) {
    Write-Host "Password must be of at least 10 characters!" -ForegroundColor Red
    $LastExitCode = 1
}
elseif (($password -cmatch '[a-z]') -and ($password -cmatch '[A-Z]') -and ($password -match '\d') -and ($password.length -ge 10) ) {
    Write-Host "Strong password" -ForegroundColor Green
    $LastExitCode = 0
}
else {
    Write-Host "Password must contain atleast 1 uppercase, lowercase and digits" -ForegroundColor Red
    $LastExitCode = 1
}
EXIT $LastExitCode
