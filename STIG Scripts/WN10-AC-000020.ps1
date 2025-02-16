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
    STIG-ID         : WN10-AC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-AC-000020.ps1 
#>

# Set the password history policy to 24 passwords remembered
secedit /export /cfg C:\Windows\Temp\secpol.cfg

# Modify the policy setting in the exported configuration file
(Get-Content C:\Windows\Temp\secpol.cfg) -replace "PasswordHistorySize = \d+", "PasswordHistorySize = 24" | Set-Content C:\Windows\Temp\secpol.cfg

# Apply the updated security policy
secedit /configure /db c:\windows\security\local.sdb /cfg C:\Windows\Temp\secpol.cfg /areas SECURITYPOLICY

# Remove the temporary file
Remove-Item C:\Windows\Temp\secpol.cfg -Force

# Force a group policy update to apply changes
gpupdate /force
