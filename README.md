# Powershell-Commands

<h3>For Displaying Current Path</h3>

```
pwd
```
<h3>Background Processes</h3>

```
ps
```
<h3>Directories</h3>

```
ls
```

<h3>Start Powershell</h3>

```
start powershell
```

<h3>Powershell Version</h3>

```
$PSVersionTable
```

<h3>Show all commands</h3>

```
Get-Command
```

<h3>Hide directory</h3>

```
attrib +h <directory-name>
```

<h3>Unhide directory</h3>

```
attrib -h <directory-name>
```

<h3>Running Task</h3>

```
tasklist
```

<h3>CPU information</h3>

```
wmic
```

```
cpu
```

<h3>Provide GUI to see System Info</h3>

```
msinfo32
```

<h3>CPU information</h3>

```
wmic
```
<hr>
<h1> Disk Commands</h1>
<hr>
<h3>Enable Disk Command</h3>

```
diskpart
```

<h3>List Disk</h3>

```
list disk
```

<h3>Select Disk</h3>

```
select disk <disk-no>
```
<h3>Check Disk health</h3>

```
chkdsk
```
<hr>

<h3>System Info</h3>

```
systeminfo
```

<h3>IP Address Details</h3>

```
Get-NetIPAddress
```

<h3>Adapter Details</h3>

```
Get-NetAdapter
```

<h3>Change IP address and default gateway</h3>

```
New-NetIPAddress -InterfaceIndex <Provided Index ex.(12)> -IPAddress <Your IPv4 Address> -PrefixLength 8 -DefaultGateway <Your Gateway Address>
```

<h3>Rename Adapter</h3>

```
Rename-NetAdapter -name <current-name> -NewName <New Name>
```

<h3>Disable Adapter</h3>

```
Disable-NetAdapter -ifAlias <Adapter-name>
```

<h3>Enable Adapter</h3>

```
Enable-NetAdapter -ifAlias <Adapter-name>
```

<h3>Rename Computer</h3>

```
Rename-Computer -NewName "<Name>"
```

<h3>Get Process Info</h3>

```
Get-Process <Process-name>
```

<h3>Stop a process</h3>

```
Get-Process <process-name> | stop-process
```

<h3>Start a process</h3>

```
start-process <process-name>
```

<h3>See Services</h3>

```
net start
```

<h3>Stop a service</h3>

```
net stop <service-name>
```

<p>or</p>

```
Stop-Service "<service-name>"
```

<h3>Cmdlet to see services</h3>

```
 Get-Service
```

<h3>Show Services whose Status is running</h3>
<p>here <b>$_.Status</b> refers to Column <b>Status</b></p>

```
Get-Service | Where-Object {$_.Status -eq 'running'}
```

<h3>To Know about Windows</h3>

```
 winver
```

<h3>get volume info</h3>

```
Get-Volume
```

<h3>See OS Version</h3>

```
[System.Environment]::OSVersion.Version
```

<h3>See BIOS Version</h3>

```
wmic
```

```
bios get smbiosbiosversion
```

<h3>Get Route from your system to a website</h3>

```
tracert <Url (ex: www.google.com)>
```

<h3>See All Adapters Name</h3>

```
wmic
```

```
nic get name
```

<h3>See all the available WiFi Networks</h3>

```
netsh wlan show all
```

<h3>Disconnect Wifi</h3>

```
Disable-NetAdapter "Wi-Fi"
```

<h3>Enable Wifi</h3>

```
Enable-NetAdapter "Wi-Fi"
```

<h3>Show Information of a website </h3>

```
nslookup <Url (ex: www.yahoo.com)
```

<h3>Copy The cmd text in a txt file</h3>

```
 echo hi there > <filename.txt>
```
<p>or</p>

```
Set-Content <filename.txt> "hello this is a text"
```

<h3>Shutdown System after 200 seconds</h3>

```
 shutdown -s -t 200
```
