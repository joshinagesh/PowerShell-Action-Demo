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

echo "LookupValue=SHELL01" >> $env:GITHUB_OUTPUT
