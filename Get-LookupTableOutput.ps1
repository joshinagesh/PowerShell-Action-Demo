param(
    [string] $TableName,
    [string] $Query,
    [string] $Column
)

$TenantId
$env.TenantId
$secrets.TenantId

$ClientId
$ClientSecret
#echo "::set-output name=LookupValue::$TableName"
echo "LookupValue=SHELL01" >> $env:GITHUB_OUTPUT
Write-Host "TableName: $($TableName)"
Write-Host "Query: $($Query)"
Write-Host "ColumnName: $($Column)"
$TableName
$Query
$Column

echo "LookupValue=SHELL02" >> $GITHUB_OUTPUT

try {
    $request = Invoke-RestMethod -Method POST `
        -Uri "https://login.microsoftonline.com/$TenantName/oauth2/token"`
        -Body @{ resource = $resourceAppIdURI; grant_type = "client_credentials"; client_id = $clientId; client_secret = $secret }`
        -ContentType "application/x-www-form-urlencoded"
    $access_token = $request.access_token
    $access_token
}
catch {
    $_
    $_ >> $env:GITHUB_OUTPUT
}
