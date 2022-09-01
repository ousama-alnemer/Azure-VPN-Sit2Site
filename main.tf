/*
    .SYNOPSIS
        Configure the Azure provider, Provider version and Terraform backend setup for Windows Virtual Machine 2019 provisioning.
    .DESCRIPTION
        This is the main file which performs below:
        a.) Defines the cloud resource provider
        b.) Terraform backend setup
        c.) Code to call modules for provisioning Windows Virtual Machine 2019 Datacenter
    .NOTES
        Version: 0.1
        Created By: Ousama alnemer
        Creation Date: 15 June 2022
        Modified By: Anil Kumar
        Modified Date: 16 June 2022
        -dd
*/

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 0.14.9"
  
  # Backend setup to maintain Terraform state file
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "abcd1234abcd"
    container_name       = "tfstate"
    key                  = "winterraform.tfstate"
  }
}

provider “azurerm” {
      subscription_id = "79156d6a-8aa3-4824-9534-684ced8aec23"
features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "vnet-hub-rg"
  location = "West Europe"
}

resource "azurerm_network_security_group" "sgn-01" {
  name                = "example-security-group"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-hub"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.100.0.0/16"]

  subnet {
    name           = "sub-01"
    address_prefix = "10.100.1.0/24"
  }
  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "subgateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.100.2.0/26"]
}


resource "azurerm_local_network_gateway" "peer-gateway" {
  name                = "peer-vpn-gateway"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  gateway_address     = "12.13.14.15"
  address_space       = ["10.66.0.0/16"]
}

resource "azurerm_public_ip" "vpn-ip" {
  name                = "vpn-gateway-ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "standard"

  tags = {
    environment = "Production"
  }
}

resource "azurerm_virtual_network_gateway" "vpn-gateway" {
  name                = "test"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = "vpn-gateway-ip"
    public_ip_address_id          = azurerm_public_ip.vpn-ip.id
    subnet_id                     = azurerm_subnet.subgateway.id
  }
 }



 /*          
## Azure Cloud Provider name
provider "azurerm" {
  features {}
}

# Call resource group module 
module "resourcegroup" {
  source = "./modules/resource-group"

  resourcegroupname = "${var.resourcegroupname}"
  location          = var.location
}

# Call Virtual Network module
module "virtualnetwork" {
  source = "./modules/virtual-network"
  vnetname          = "${var.vnetname}"
  vnetaddressspace  = var.vnetaddressspace
  location          = module.resourcegroup._resourcegrouplocation
  resourcegroupname = module.resourcegroup._resourcegroupname
}

# Call Subnet module
module "subnet" {
  source = "./modules/subnet"

  subnetname         = "${var.subnetname}"
  subnetaddressspace = var.subnetaddressspace
  vnetname           = module.virtualnetwork._vnetname
  location           = module.resourcegroup._resourcegrouplocation
  resourcegroupname  = module.resourcegroup._resourcegroupname
}

# #Call Subnet module
module "subnetvpngateway" {
  source = "./modules/subnetvpngateway"
  subnetnamevpn         = "${var.subnetnamevpn}"
  subnetaddressvpn      = var.subnetaddressvpn
  vnetname              = module.virtualnetwork._vnetname
  location              = module.resourcegroup._resourcegrouplocation
  resourcegroupname     = module.resourcegroup._resourcegroupname

}

# Call Public IP module
module "publicip" {
  source = "./modules/public-ip"

  publicipname      = "${var.publicipname}"
  location          = module.resourcegroup._resourcegrouplocation
  resourcegroupname = module.resourcegroup._resourcegroupname
  environment       = var.environment
}

 # ## Call localvnetgateway module
module "localvnetgateway" {
  source = "./modules/localvnetgateway"
  peervnetgetwayname    = "${var.peervnetgetwayname}"
  location              = module.resourcegroup._resourcegrouplocation
  resourcegroupname     = module.resourcegroup._resourcegroupname
  peergatewayaddress    = var.peergatewayaddress
  peeraddressspace      = var.peeraddressspace
 }


  ## Call vpngateway module
module "vpngateway" {
  source = "./modules/vpngateway"
  vpngatewayname        = "${var.vpngatewayname}"
  location              = module.resourcegroup._resourcegrouplocation
  resourcegroupname     = module.resourcegroup._resourcegroupname
  skuvalue              = var.skuvalue
  subnetvpn             = var.subnetnamevpn
  publicipname          = module.publicip._publicipname
  type                  = "vpn" 
  publicipid            = module.publicip._publicipid
  subnetid              = module.subnetvpngateway._subnetid 
  publicip              = module.publicip.azurerm_public_ip
  #public_ip_address_id  = module.publicip._publicipid

  ip_configuration {
  name                  = "${var.publicipname}"
  public_ip_address_id  = module.publicip.azurerm_public_ip
  subnet_id            = module.subnetvpngateway._subnetid
  
   }
}


output "azurerm_subnet" {
  value = resource.azurerm_subnet.subnetvpn.id
} 

output "azurerm_public_ip" {
  value = resource.azurerm_public_ip.publicip.id
}

*/

