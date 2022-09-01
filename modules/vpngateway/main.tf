resource "azurerm_virtual_network_gateway" "vpngateway" {
  name                = var.vpngatewayname
  location            = var.location
  resource_group_name = var.resourcegroupname
  sku                 = "VpnGw1"
  type                = "vpn" 
 

  ip_configuration {
  name                  = var.publicipname
  public_ip_address_id  = module.publicip._publicipid
  subnet_id             = module.subnetvpngateway._subnetvpn.id
  
   }
}
  

  
  
  
  
  
  
  
#   ip_configuration {
#   name                          = var.publicipname
#   public_ip_address_id          = var.publicipid
#   subnet_id                     = var.subnetid
#  }
#}

