param(
    [string] $TableName,
    [string] $Query,
    [string] $Column
)

#echo "::set-output name=LookupValue::$TableName"
echo "LookupValue=SHELL01" >> $env:GITHUB_OUTPUT
Write-Host "TableName: $($TableName)"
Write-Host "Query: $($Query)"
Write-Host "ColumnName: $($Column)"
$TableName
$Query
$Column

echo "LookupValue=SHELL02" >> $GITHUB_OUTPUT
