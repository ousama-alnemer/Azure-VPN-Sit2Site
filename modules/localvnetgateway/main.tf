
resource "azurerm_local_network_gateway" "localvnetgetway" {
  name                = "localvnetgetway"
  resource_group_name = var.resourcegroupname
  location            = var.location
  gateway_address     = var.localgatewayaddress
  address_space       = var.peeraddressspace
}

