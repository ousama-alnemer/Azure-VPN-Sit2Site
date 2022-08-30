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
  virtual_network_name = var.vnetname
  sku_name             = var.sku_name
  sku_tier             = var.sku_tier
  publicipname         = var.publicipname
}
  # delegation {
  #   name = "subnet-delegation"
  #
  #   service_delegation {
  #     name    = "Microsoft.Web/serverFarms"
  #     actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
  #   }
  # }


