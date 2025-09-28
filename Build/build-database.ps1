. "$PSScriptRoot/config.ps1"

$dbFolder = Join-Path $PSScriptRoot "..\Database"
$createDatabaseFile = Join-Path $dbFolder "create-database.sql"
$createTablesFile = Join-Path $dbFolder "create-tables.sql"
$loadTablesFile = Join-Path $dbFolder "load-tables.sql"

Write-Host "Creating database"
& psql -h $env:PGHOST -p $env:PGPORT -U $env:PGUSER -d postgres -f $createDatabaseFile
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host "Creating database"
& psql -h $env:PGHOST -p $env:PGPORT -U $env:PGUSER -d $env:PGDATABASE -f $createTablesFile
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host "Loading Tables"
& psql -h $env:PGHOST -p $env:PGPORT -U $env:PGUSER -d $env:PGDATABASE -f $loadTablesFile
if ($LASTEXITCODE -ne 0) { exit 1 }
