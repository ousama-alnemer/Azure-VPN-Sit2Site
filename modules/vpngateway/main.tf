resource "azurerm_virtual_network_gateway" "vpngateway" {
  name                = var.vpngatewayname
  location            = var.location
  resource_group_name = var.resourcegroupname
  sku                 = "VpnGw1"
  type                = "vpn" 
 

  ip_configuration {
  name                  = var.publicipname
  public_ip_address_id  = resource.azurerm_public_ip.publicip.id
  #subnet_id              = azurerm_subnet.subnetvpn._subnetid
  
   }
}
  

  
  
  
  
  
  
  
#   ip_configuration {
#   name                          = var.publicipname
#   public_ip_address_id          = var.publicipid
#   subnet_id                     = var.subnetid
#  }
#}

