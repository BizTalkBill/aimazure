<#
.SYNOPSIS
Removes routing properties from app config.

.DESCRIPTION
Prior to running this script ensure you are authenticated against Azure and have the desired subscription set.

.PARAMETER configStoreName
The name of the application configuration store.

.PARAMETER key
The key of the item remove from the configuration store.

.PARAMETER label
The label of the item remove from the configuration store.

.EXAMPLE
.\TearDown-100-RoutingProperties-AppConfig.ps1 -configStoreName "appcfg-aimroutestore-dev" -key "SampleConfigKey" -label "SampleLabel"
#>

[CmdletBinding()]
Param(
    [parameter(Mandatory = $true)]    
    [string] $configStoreName,
    [parameter(Mandatory = $true)]
    [string] $key,
    [parameter(Mandatory = $true)]
    [string] $label
)

Write-Host "Removing the routing properties for key $key"

az appconfig kv delete --name $configStoreName --key $key --label $label --yes

Write-Host "Removed routing properties for the key $key"