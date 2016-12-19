cd /d %~dp0
PowerShell.exe -ExecutionPolicy Bypass -Command "& '.\Set-WmiNamespaceSecurity.ps1'" root/cimv2 add %1 Enable,MethodExecute,FullWrite,PartialWrite,ProviderWrite,RemoteAccess,ReadSecurity,WriteSecurity

REM Changed COM security to enable %1 to do this
DComPerm.exe -dl set %1 permit level:ll,rl,la,ra
DComPerm.exe -ml set %1 permit level:ll,rl,la,ra

REM Add ports for SMB and RPC
netsh advfirewall firewall set rule group="Windows Management Instrumentation (WMI)" new enable=yes


REM Set WMI to port 24158
PowerShell.exe -ExecutionPolicy Bypass -Command "& '.\stopServices.ps1'"
net stop "Windows Management Instrumentation"
net start "Windows Management Instrumentation"
netsh advfirewall firewall add rule name="Open TCP 24158 (WmiFixedPort)" dir=in action=allow protocol=TCP localport=24158

REM Starting all processes
sc config RasAuto start= auto
net start "Remote Access Auto Connection Manager"
sc config RasMan start= auto
net start "Remote Access Connection Manager"
sc config RpcSs start= auto
net start "Remote Procedure Call (RPC)"
sc config RpcLocator start= auto
net start "Remote Procedure Call (RPC) Locator"
sc config RemoteRegistry start= auto
net start "Remote Registry"
