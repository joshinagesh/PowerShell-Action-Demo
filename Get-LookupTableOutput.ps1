param(
    [string] $TableName,
    [string] $Query,
    [string] $Column,
    [string] $Context
)

$env:GITHUB_ENV
$env:GITHUB_ACTION_PATH
$env:GITHUB_REPOSITORY
$env:GITHUB_RUN_ID
$env:GITHUB_JOB

$token
$Context

$env:GITHUB_CONTEXT

#echo "::set-output name=LookupValue::$TableName"
echo "LookupValue=SHELL01" >> $env:GITHUB_OUTPUT
# Write-Host "TableName: $($TableName)"
# Write-Host "Query: $($Query)"
# Write-Host "ColumnName: $($Column)"
# $TableName
# $Query
# $Column

$env

# try {
#     $request = Invoke-RestMethod -Method POST `
#         -Uri "https://login.microsoftonline.com/$TenantName/oauth2/token"`
#         -Body @{ resource = $resourceAppIdURI; grant_type = "client_credentials"; client_id = $clientId; client_secret = $secret }`
#         -ContentType "application/x-www-form-urlencoded"
#     $access_token = $request.access_token
#     $access_token
# }
# catch {
#     $_
#     $_ >> $env:GITHUB_OUTPUT
# }
