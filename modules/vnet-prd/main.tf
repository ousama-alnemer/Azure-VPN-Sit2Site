resource "azurerm_resource_group" "rg" {
  name     = "vnet-prd-rg"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-prd-01"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "sub-01" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "ip" {
  name                = "IP-prod-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

#resource "azurerm_firewall" "example" {
#  name                = "testfirewall"
#  location            = azurerm_resource_group.example.location
#  resource_group_name = azurerm_resource_group.example.name
#  sku_name            = "AZFW_VNet"
#  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.sub.id
    public_ip_address_id = azurerm_public_ip.ip.id
  }
 }