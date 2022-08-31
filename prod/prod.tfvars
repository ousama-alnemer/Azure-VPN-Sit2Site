increment                     = "01"
environment                   = "prod"
vmsize                        = "standard_f2s_v2"
vmimagesku                    = "2019-Datacenter"
storageaccounttier            = "Standard"
storageaccountreplicationtype = "GRS"
vnetaddressspace              = "10.68.0.0/16"
subnetaddressspace            = "10.68.1.0/24"
subnetaddressspacefirewall    = "10.68.2.0/24"
location                      = "westeurope"
containeraccesstype           = "private"
subnetnamefirewall            = "AzureFirewallSubnet"
skuname                       = "AZFW_VNet"
skutier                       = "Standard"
firewallname                  = "firewall-prod"
peeraddressspace              = "10.66.0.0/16"
peergatewayaddress            = "178.155.227.114"
peervnetgetwayname            = "localvnetgateway"
