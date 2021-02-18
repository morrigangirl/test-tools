$SB = '[System.Diagnostics.Process]::Start("C:\Program Files (x86)\Nmap\Nmap.exe", "-oG scan.txt -v -Pn -p 1-65535 192.168.29.1/32")'

$SBString = $SB.ToString()
$SBBytes = [System.Text.Encoding]::Unicode.GetBytes($SBString)
$SBEncoded = [Convert]::ToBase64String($SBBytes)
write($SBEncoded)

$Command = "powershell.exe -encodedCommand $SBEncoded -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden"

Invoke-CimMethod -ComputerName . -Namespace root\cimv2 -ClassName Win32_Process -MethodName Create -Arguments @{CommandLine=$Command}