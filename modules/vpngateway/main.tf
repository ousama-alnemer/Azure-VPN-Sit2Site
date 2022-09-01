resource "azurerm_virtual_network_gateway" "vpngateway" {
  name                = var.vpngatewayname
  location            = var.location
  resource_group_name = var.resourcegroupname
  sku                 = var.skuvalue
  type                = "vpn" 
 
   ip_configuration {
   name                          = var.publicipname
   #public_ip_address_id          = var.publicipid
  # subnet_id                     = azurerm_subnet.subnetvpn.id
  }
}

