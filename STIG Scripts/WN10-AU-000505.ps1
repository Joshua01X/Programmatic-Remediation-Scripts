<#
.SYNOPSIS
    This PowerShell script ensures that the Security event log size must be configured to 1024000 KB or greater.

.NOTES
    Author          : Joshua Balondo
    LinkedIn        : linkedin.com/in/joshuabalondo1/
    GitHub          : github.com/Joshua01X
    Date Created    : 2025-02-16
    Last Modified   : 2024-02-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-AU-000505.ps1 
#>

# Define the registry path and value
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"
$RegName = "MaxSize"
$RegValue = 1024000  # 1024000 KB as per STIG requirement

# Ensure the registry path exists
if (!(Test-Path $RegPath)) {
    Write-Host "Creating registry path: $RegPath"
    New-Item -Path $RegPath -Force | Out-Null
}

# Apply the registry setting
Write-Host "Setting Security Event Log Maximum Size to 1024000 KB..."
Set-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -Type DWord

# Verify the applied setting
$AppliedValue = (Get-ItemProperty -Path $RegPath -Name $RegName).$RegName
Write-Host "Verification: Security Event Log Size is set to $AppliedValue KB"

# Refresh Group Policy to apply changes
Write-Host "Refreshing Group Policy..."
gpupdate /force
