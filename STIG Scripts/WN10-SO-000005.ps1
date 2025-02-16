<#
.SYNOPSIS
    This PowerShell script ensures that the built-in administrator account must be disabled.

.NOTES
    Author          : Joshua Balondo
    LinkedIn        : linkedin.com/in/joshuabalondo1/
    GitHub          : github.com/Joshua01X
    Date Created    : 2025-02-16
    Last Modified   : 2024-02-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-SO-000005.ps1 
#>

# Identify the built-in Administrator account by SID
$AdminAccount = Get-LocalUser | Where-Object { $_.SID -like "S-1-5-21-*-500" }

# Disable the built-in Administrator account
if ($AdminAccount) {
    Disable-LocalUser -Name $AdminAccount.Name
    Write-Output "The built-in Administrator account ($($AdminAccount.Name)) has been disabled."
} else {
    Write-Output "No built-in Administrator account found."
}

# Verify the status
Get-LocalUser -Name $AdminAccount.Name
