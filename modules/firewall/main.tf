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

resource "azurerm_firewall" "firewall" {
  name                 = var.firewallname
  location             = var.location
  resource_group_name  = var.resourcegroupname
  sku_name             = var.skuname
  sku_tier             = var.skutier
}
  # delegation {
  #   name = "subnet-delegation"
  #
  #   service_delegation {
  #     name    = "Microsoft.Web/serverFarms"
  #     actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
  #   }
  # }


