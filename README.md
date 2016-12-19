# WMI Enabler
This is a simple batch file that, when ran, will enable WMI for the computer.

## Usage
```batch
enabler.bat <username>
```

## Attribution Notes
[`Set-WmiNamespaceSecurity.ps1`](https://blogs.msdn.microsoft.com/wmi/2009/07/27/scripting-wmi-namespace-security-part-3-of-3/) and [`DComPerm.exe`*](https://www.microsoft.com/en-us/download/details.aspx?id=8279) are directly from Microsoft. No support will be provided for them, and their respective licences overrule the project's licence.

[\* The source code for `DComPerm.exe` is included with the Microsoft Windows SDK for Windows 7 and .NET Framework 4.
The project source directory is:
`C:\Program Files\Microsoft SDKs\Windows\v7.1\Samples\com\fundamentals\dcom\dcomperm`](http://serverfault.com/questions/333766/how-to-get-dcomperm-exe-from-microsoft)
