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

           



# Azure Cloud Provider name
provider "azurerm" {
  features {}
}

# Call resource group module 
module "resourcegroup" {
  source = "./modules/resource-group"

  resourcegroupname = "${var.resourcegroupname}-${var.applicationname}-${var.environment}-${var.locationacronym}-${var.increment}"
  location          = var.location
}

# Call Virtual Network module
module "virtualnetwork" {
  source = "./modules/virtual-network"

  vnetname          = "${var.vnetname}-${var.applicationname}-${var.environment}-${var.locationacronym}-${var.increment}"
  vnetaddressspace  = var.vnetaddressspace
  location          = module.resourcegroup._resourcegrouplocation
  resourcegroupname = module.resourcegroup._resourcegroupname
}

# Call Subnet module
module "subnet" {
  source = "./modules/subnet"

  subnetname         = "${var.subnetname}-${var.applicationname}-${var.environment}-${var.locationacronym}-${var.increment}"
  subnetaddressspace = var.subnetaddressspace
  vnetname           = module.virtualnetwork._vnetname
  location           = module.resourcegroup._resourcegrouplocation
  resourcegroupname  = module.resourcegroup._resourcegroupname
}

# Call Subnetfirewall module
module "subnetfirewall" {
  source = "./modules/subnetfirewall"
  subnetnamefirewall         = "${var.subnetnamefirewall}"
  subnetaddressspacefirewall = var.subnetaddressspacefirewall
  vnetname                   = module.virtualnetwork._vnetname
  location                   = module.resourcegroup._resourcegrouplocation
  resourcegroupname          = module.resourcegroup._resourcegroupname
}



# Call Public IP module
module "publicip" {
  source = "./modules/public-ip"

  publicipname      = "${var.publicipname}-${var.applicationname}-${var.environment}-${var.locationacronym}-${var.increment}"
  location          = module.resourcegroup._resourcegrouplocation
  resourcegroupname = module.resourcegroup._resourcegroupname
  environment       = var.environment
}

# Call Network Interface module
module "networkinterface" {
  source = "./modules/network-interface"

  networkinterfacename = "${var.networkinterfacename}-${var.applicationname}-${var.environment}-${var.locationacronym}-${var.increment}"
  subnetid             = module.subnet._subnetid
  location             = module.resourcegroup._resourcegrouplocation
  resourcegroupname    = module.resourcegroup._resourcegroupname
  publicipid           = module.publicip._publicipid
}

# Call firewall module
module "firewall" {
  source = "./modules/firewall"
  name              = "${var.firewallname}-${var.environment}"
  location          = module.resourcegroup._resourcegrouplocation
  resourcegroupname = module.resourcegroup._resourcegroupname
  environment       = var.environment
  sku_name          = var.sku_name
  sku_tier          = var.tier
  publicipname      = var.publicipname
}
