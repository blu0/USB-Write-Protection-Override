#This script is designed to Disable (or Enable) the Write Protection Policy on the local machine, commonly used to prevent copying files to USB drives
#The companion batch script can be used to create a scheduled task that runs at start up or is simply used to run periodically as desired
#This script is intended to be used as an emergency work around or for pentesting, not to circumvent company policies for funsies

#Check for existing Registry Key
$a = Test-Path -Path "HKLM:\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies"
IF ($a -eq $false) {
#Create Registry Key and Set Value
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies"
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" -Name "WriteProtect"
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" -Name "WriteProtect" -Value 0
}ELSE{
#Disable Write Protection
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" -Name "WriteProtect" -Value 0}
#Changing Value to 1 will Enable Write Protection if desired