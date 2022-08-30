
resource "azurerm_local_network_gateway" "lgw" {
  name                = var._localnetworkgateway
  resource_group_name = var.resourcegroupname
  location            = var.location
  gateway_address     = var.peergatewayaddress
  address_space       = [var.peerIpaddressrange]
}



