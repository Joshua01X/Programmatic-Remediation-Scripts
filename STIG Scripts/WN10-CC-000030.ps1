<#
.SYNOPSIS
    This PowerShell script ensures that the system must be configured to prevent Internet Control Message Protocol (ICMP) redirects from overriding Open Shortest Path First (OSPF) generated routes.

.NOTES
    Author          : Joshua Balondo
    LinkedIn        : linkedin.com/in/joshuabalondo1/
    GitHub          : github.com/Joshua01X
    Date Created    : 2025-02-16
    Last Modified   : 2024-02-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         :  WN10-CC-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\ WN10-CC-000030.ps1 
#>

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "EnableICMPRedirect" -Value 0 -Type DWord
