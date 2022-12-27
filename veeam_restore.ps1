Install-Module -Name VeeamPS -Force
Connect-VBRServer -Server veeam-server -User veeam-user
$backup = Get-VBRBackup | Where-Object {$_.Name -eq "My Backup Job"}
$restorePoint = Get-VBRRestorePoint -Backup $backup | Sort-Object -Property CreationTime -Descending | Select-Object -First 1
Start-VBRFileRestore -RestorePoint $restorePoint -Path "C:\My File.txt" -Destination "C:\Restore"
