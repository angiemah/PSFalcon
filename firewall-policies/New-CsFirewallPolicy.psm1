function New-CsFirewallPolicy {
<#
    .SYNOPSIS
       Create Firewall policies by specifying details about the policy to create

    .PARAMETER RESOURCES
        An array of Firewall policy properties
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Resources
    )
    process{
        $Param = @{
            Uri = '/policy/entities/firewall/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{ resources = $Resources } | ConvertTo-Json -Depth 16
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}