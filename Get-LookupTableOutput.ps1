param(
    [string] $TableName,
    [string] $Query,
    [string] $Column
)

Write-Host "TableName: $($TableName)"
Write-Host "Query: $($Query)"
Write-Host "ColumnName: $($Column)"
$TableName
$Query
$Column

$TenantName = "3154f54d-54c8-4ced-ac8d-1535d6d75ace"
$resourceAppIdURI = "a6b7b60c-001b-42dd-9b0e-c89ad1cf699c"
$clientId = "a6b7b60c-001b-42dd-9b0e-c89ad1cf699c"
$secret = "Ze58Q~PEyb4uJjJPSJCK7gcoZFek2n2vAvxvEaOs"

$request = Invoke-RestMethod -Method POST `
    -Uri "https://login.microsoftonline.com/$TenantName/oauth2/token"`
    -Body @{ resource = $resourceAppIdURI; grant_type = "client_credentials"; client_id = $clientId; client_secret = $secret }`
    -ContentType "application/x-www-form-urlencoded"
$access_token = $request.access_token
$access_token
