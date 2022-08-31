
resource "azurerm_local_network_gateway" "localvnetgetway" {
  name                   = var.peervnetgetwayname
  resource_group_name    = var.resourcegroupname
  location               = var.location
  gateway_address        = var.peergatewayaddress
  address_space          = var.peeraddressspace
}

