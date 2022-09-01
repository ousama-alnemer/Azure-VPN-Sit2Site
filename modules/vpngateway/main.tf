resource "azurerm_virtual_network_gateway" "vpngateway" {
  name                = var.vpngatewayname
  location            = var.location
  resource_group_name = var.resourcegroupname
  sku                 = "var.skuvalue"
  type                = "vpn" 
 
  ip_configuration {
  name                  = var.publicipname
  public_ip_address_id            = "/subscriptions/79156d6a-8aa3-4824-9534-684ced8aec23/resourceGroups/vnet-hub-rg/providers/Microsoft.Network/publicIPAddresses/vpn-public-ip"
  subnet_id              = "9442b8d4-afca-4849-b9b2-9ba0d9d2260e"
  
   }
}
  
  
  
  
  
  
  
  
  
#   ip_configuration {
#   name                          = var.publicipname
#   public_ip_address_id          = var.publicipid
#   subnet_id                     = var.subnetid
#  }
#}

