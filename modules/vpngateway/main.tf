
# Call Public IP module
module "publicip" {
  source = "./modules/public-ip"

  publicipname      = "${var.publicipname}"
  location          = module.resourcegroup._resourcegrouplocation
  resourcegroupname = module.resourcegroup._resourcegroupname
  environment       = var.environment
}



resource "azurerm_virtual_network_gateway" "vpngateway" {
  name                = var.vpngatewayname
  location            = var.location
  resource_group_name = var.resourcegroupname
  sku                 = "var.skuvalue"
  type                = "vpn" 
 
  ip_configuration {
  name                  = var.publicipname
  public_ip_address_id            = module.publicip._publicipid
  subnet_id              = module.subnetvpngateway._subnetvpn.id
  
   }
}
  
  
  
  
  
  
  
  
  
#   ip_configuration {
#   name                          = var.publicipname
#   public_ip_address_id          = var.publicipid
#   subnet_id                     = var.subnetid
#  }
#}

