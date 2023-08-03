param(
    [string] $TableName,
    [string] $Query,
    [string] $Column,
    [string] $GitHubToken
)

$GitHubToken



$env:GITHUB_ENV
$env:GITHUB_ACTION_PATH
$env:GITHUB_REPOSITORY
$env:GITHUB_RUN_ID
$env:GITHUB_JOB

$GitHubToken


$env:testenv

#echo "::set-output name=LookupValue::$TableName"
echo "LookupValue=SHELL01" >> $env:GITHUB_OUTPUT
# Write-Host "TableName: $($TableName)"
# Write-Host "Query: $($Query)"
# Write-Host "ColumnName: $($Column)"
# $TableName
# $Query
# $Column

$env

try {
    $Uri = "https://api.github.com/repositories/672865066/environments/Staging/secrets"
    $reqHeaders = @{
        "Authorization"        = "Bearer $($GitHubToken)";
        "Accept"               = "application/vnd.github+json";
        "X-GitHub-Api-Version" = "2022-11-28"
    }
    $res = Invoke-RestMethod -Method GET -Uri $Uri -Headers $reqHeaders
    $res
}
catch {
    $_
}
