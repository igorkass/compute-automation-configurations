$disk = Get-Disk | Where-Object partitionstyle -eq 'raw' | Sort-Object number
$driveLetter = "F"
$label = "FabricData"

$disk | 
    Initialize-Disk -PartitionStyle MBR -PassThru |
    New-Partition -UseMaximumSize -DriveLetter $driveLetter |
    Format-Volume -FileSystem NTFS -NewFileSystemLabel $label -Confirm:$false -Force
