echo "`n"
echo "-: System Information :-"
echo "`n"
echo "`n"

"    System Hardware details    "
echo "`n"
if ((Get-WmiObject Win32_computersystem).PSComputerName -ne $null) { Write-Host -NoNewline "ComputerName: " (Get-WmiObject Win32_computersystem).PSComputerName; echo "`n" }
if ( (Get-WmiObject Win32_computersystem).CreationClassName -ne $null) { Write-Host -NoNewline "System Type: " (Get-WmiObject Win32_computersystem).CreationClassName; echo "`n" }
if ( (Get-WmiObject Win32_computersystem).Manufacturer -ne $null) { Write-Host -NoNewline "Manufacturer: " (Get-WmiObject Win32_computersystem).Manufacturer; echo "`n" }
if ( (Get-WmiObject Win32_computersystem).Model -ne $null) { Write-Host -NoNewline "Model: " (Get-WmiObject Win32_computersystem).Model; echo "`n" }
if ( (Get-WmiObject Win32_computersystem).SystemType -ne $null) { Write-Host -NoNewline "SystemType: " (Get-WmiObject Win32_computersystem).SystemType }
echo "`n"
echo "`n"

echo "   Operating System details    "
echo "`n"
if ( (Get-WmiObject Win32_OperatingSystem).Caption -ne $null) { Write-Host -NoNewline "Operating System Name: " (Get-WmiObject Win32_OperatingSystem).Caption; echo "`n" }
if ( (Get-WmiObject Win32_OperatingSystem).Version -ne $null) { Write-Host -NoNewline "Operating System Version: " (Get-WmiObject Win32_OperatingSystem).Version }
echo "`n"
echo "`n"

"    System Processor details    "
echo "`n"
if ( (Get-WmiObject Win32_processor).Description -ne $null) { Write-Host -NoNewline "Description :" (Get-WmiObject Win32_processor).Description; echo "`n" }
if ( (Get-WmiObject Win32_processor).Name -ne $null) { Write-Host -NoNewline "Name :" (Get-WmiObject Win32_processor).Name; echo "`n" }
if ( (Get-WmiObject Win32_processor).NumberOfCores -ne $null) { Write-Host -NoNewline "NumberOfCores :" (Get-WmiObject Win32_processor).NumberOfCores; echo "`n" }
if ( (Get-WmiObject Win32_processor).NumberOfEnabledCore -ne $null) { Write-Host -NoNewline "NumberOfEnabledCore :" (Get-WmiObject Win32_processor).NumberOfEnabledCore; echo "`n" }

if ( (Get-WmiObject Win32_processor).NumberOfLogicalProcessors -ne $null) { Write-Host -NoNewline "NumberOfLogicalProcessors :" (Get-WmiObject Win32_processor).NumberOfLogicalProcessors; echo "`n" }
if ( (Get-WmiObject Win32_processor).L1CacheSize -ne $null) { Write-Host -NoNewline "L1CacheSize :" (Get-WmiObject Win32_processor).L3CacheSize; echo "`n"}
if ( (Get-WmiObject Win32_processor).L2CacheSize -ne $null) { Write-Host -NoNewline "L2CacheSize :" (Get-WmiObject Win32_processor).L3CacheSize; echo "`n"}

if ( (Get-WmiObject Win32_processor).L3CacheSize -ne $null) { Write-Host -NoNewline "L3CacheSize :" (Get-WmiObject Win32_processor).L3CacheSize }
echo "`n"
echo "`n"

"    System Physical Memory details    "
echo "`n"
if ( (Get-WmiObject Win32_physicalmemory).Description -ne $null) { Write-Host -NoNewline "Description :" (Get-WmiObject Win32_physicalmemory).Description;echo "`n" }
if ( (Get-WmiObject Win32_physicalmemory).Manufacturer -ne $null) { Write-Host -NoNewline "Manufacturer :"(Get-WmiObject Win32_physicalmemory).Manufacturer;echo "`n" }
if ( [Math]::Round((Get-WmiObject Win32_physicalmemory).Capacity/1Gb) -ne $null) { Write-Host -NoNewline "Capacity(GB) : "; [Math]::Round((Get-WmiObject Win32_physicalmemory).Capacity/1Gb); echo "`n"}
if ( (Get-WmiObject Win32_physicalmemory).BankLabel -ne $null) { Write-Host -NoNewline "BankLabel :"(Get-WmiObject Win32_physicalmemory).BankLabel;echo "`n" }
if ( ((Get-WmiObject Win32_physicalmemory)| Measure-Object).Count -ne $null) { Write-Host -NoNewline "Installed Slots:" ((Get-WmiObject Win32_physicalmemory)| Measure-Object).Count }
Format-Table -AutoSize
echo "`n"
echo "`n"

"    System Physical drive details    "
echo "`n"
Get-WmiObject -Class Win32_LogicalDisk |
Where-Object {$_.DriveType -ne 5} |
Sort-Object -Property Name |
Select-Object Name, VolumeName, VolumeSerialNumber, FileSystem, Description, `
@{"Label"="DiskSize(GB)";"Expression"={"{0:N}" -f ($_.Size/1GB) -as [float]}}, `
@{"Label"="FreeSpace(GB)";"Expression"={"{0:N}" -f ($_.FreeSpace/1GB) -as [float]}}, `
@{"Label"="%Free";"Expression"={"{0:N}" -f ($.FreeSpace/$.Size*100) -as [float]}} |
Format-Table -AutoSize
echo "`n"

"   Network Report   "


Get-CimInstance -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=$true | 
Format-Table -Property ServiceName,Index,IPaddress,Subnetmask,Description,DNSDomain,DNSServer -Autosize

"    Video Card details    "
echo "`n"
if ( (Get-WmiObject Win32_videocontroller).Name -ne $null) { Write-Host -NoNewline "Name :" (Get-WmiObject Win32_videocontroller).Name;echo "`n" }
if ( (Get-WmiObject Win32_videocontroller).Description -ne $null) { Write-Host -NoNewline "Description :" (Get-WmiObject Win32_videocontroller).Description;echo "`n" }
if ((Get-WmiObject Win32_videocontroller).VideoModeDescription -ne $null) { Write-Host -NoNewline "Resolution :" (Get-WmiObject Win32_videocontroller).VideoModeDescription }
echo "`n"
echo "`n"



