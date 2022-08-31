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
 
resource "azurerm_firewall_policy" "firewallpolicy" {
  name                = var.firewallpolicyname
  resource_group_name = var.resourcegroupname
  location            = var.location
}
