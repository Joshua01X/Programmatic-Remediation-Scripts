<#
.SYNOPSIS
    This PowerShell script ensures that the password history must be configured to 24 passwords remembered.

.NOTES
    Author          : Joshua Balondo
    LinkedIn        : linkedin.com/in/joshuabalondo1/
    GitHub          : github.com/Joshua01X
    Date Created    : 2025-02-16
    Last Modified   : 2024-02-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-CC-000005.ps1 
#>

# Define the registry path and value
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$RegName = "NoLockScreenCamera"
$RegValue = 1

# Check if the registry path exists, if not, create it
If (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -Type DWord

# Confirm the change
Write-Output "Camera access from the lock screen has been disabled."
