param(
    [string] $TableName,
    [string] $Query,
    [string] $Column,
    [string] $GitHubToken,
    [string] $TenantId,
    [string] $ClientId,
    [string] $ClientSecret,
    [string] $LookupServiceIdentifier
)

$GitHubToken

$TableName
$Column
$Query

$env:GITHUB_ENV
$env:GITHUB_ACTION_PATH
$env:GITHUB_REPOSITORY
$env:GITHUB_RUN_ID
$env:GITHUB_JOB

$GitHubToken


$env:LookupResourceId
try {
    $request = Invoke-RestMethod -Method POST `
        -Uri "https://login.microsoftonline.com/$TenantId/oauth2/token" `
        -Body @{ resource = $env:LookupResourceId; grant_type = "client_credentials"; client_id = $ClientId; client_secret = $ClientSecret }`
        -ContentType "application/x-www-form-urlencoded"
    $access_token = $request.access_token
    $access_token
}
catch {
    $_
}



try {
    $Uri = "https://staging-dna-lkup-api.azurewebsites.net/api/Lookup/odata/$($TableName)?`$filter=$Query"
    $Uri
    $reqHeaders = @{
        "Authorization" = "Bearer $($access_token)";
        "Accept"        = "application/json";
    }

    $body
    $res = Invoke-RestMethod -Method GET -Uri $Uri -Headers $reqHeaders
    $LkupValue = $res | ConvertTo-Json
    $LkupValue
    $resObj = $LkupValue | ConvertFrom-Json
    $resObj
    $propValue = $resObj.$Column
    $propValue

    echo "LookupValueJSON=$LkupValue" >> $env:GITHUB_OUTPUT
    echo "LookupRowObj=$resObj" >> $env:GITHUB_OUTPUT
}
catch {
    $_
}



#echo "::set-output name=LookupValue::$TableName"
#echo "LookupValue=SHELL01" >> $env:GITHUB_OUTPUT
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
