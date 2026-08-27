# 0. Initialize automation module in memory tracks
Import-module sqlserver -force



# 1. Define target landscape parameters
$ServerIP ="172.18.90.33"
$BackupFolder = "C:\logisticsbackups"
$CurrentDate = get-date -Format "mm-dd-yyyy_hhmm"
$BackupFile = "LogisticsNetwork_$CurrentDate.bak"

# 2. Create local rentention compartment
if (-not (test-path $BackupFolder)) {
    New-Item -ItemType directory -Path $BackupFolder
}

write-host "initializing automated remote database snapshot pipeline..." -ForegroundColor Green

# 3. Construct the backup execution string
#This commands Linux to create the backup inside its own local system folder first
$SqlQuery = "BACKUP DATABASE [LogisticsNetwork] TO DISK = N'/var/opt/mssql/data/" + $BackupFile + "' WITH NOFORMAT, NOINIT, SKIP, NOREWIND, NOUNLOAD, STATS = 10"
Write-Host "Initializing automated remote database snapshot pipeline..." -ForegroundColor Green

# 4. Execute remote container backup command
# We use the Sqlserver module tool to pass the query securely over port 1433.
Invoke-Sqlcmd -serverinstance $serverIP -Username "sa" -Password 'T@rdis3287' -query $sqlquery -trustservercertificate

Write-Host "Remote snapshot file generated successfully inside the Linux kernel." -ForegroundColor Cyan

# 5. PULL THE BACKUP FILE SECURELY VIA NATIVE SCP PIPELINE
Write-Host "Pulling snapshot across virtual network using Secure Copy Protocol..." -ForegroundColor Yellow

$LocalPath = "C:\LogisticsBackups"

# We use your explicit username 'qmccondichie' to authenticate the Linux handshake
& scp "qmccondichie@${ServerIP}:/var/opt/mssql/data/$BackupFile" $LocalPath

Write-Host "AUTOMATED DISASTER RECOVERY PIPELINE COMPLETE!" -ForegroundColor Green
