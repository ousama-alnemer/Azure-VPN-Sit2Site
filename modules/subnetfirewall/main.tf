/*
    .SYNOPSIS
        Create and configure the subnet resource

    .DESCRIPTION
        Create and configure the subnet resource

    .NOTES
        Version: 0.1
        Created By: Anil Kumar
        Creation Date: 15 June 2022
        Modified By: Anil Kumar
        Modified Date: 16 June 2022
*/

resource "azurerm_subnet-firewall" "subnetfirewall" {
  name                 = AzureFirewallSubnet
  resource_group_name  = var.resourcegroupname
  virtual_network_name = var.vnetname
  address_prefixes     = [var.subnetaddressspacefirewall]
}
  # delegation {
  #   name = "subnet-delegation"
  #   service_delegation {
  #     name    = "Microsoft.Web/serverFarms"
  #     actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
  #   }
  # }


