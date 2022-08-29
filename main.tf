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
            
             # Backend setup to maintain Terraform state file
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "abcd1234abcd"
    container_name       = "tfstate"
    key                  = "winterraform.tfstate"
  }
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

  resourcegroupname = var.resourcegroupname-prd
  location          = var.location-prd
}

# Call Virtual Network module
module "virtualnetwork" {
  source = "./modules/virtual-network"

  vnetname          = var.vnetname-prd
  vnetaddressspace  = var.vnetaddressspace
  location          = var.location-prd
  resourcegroupname = var.resourcegroupname-prd
}

# Call Subnet module
module "subnet" {
  source = "./modules/subnet"

  subnetname         = var.subnetname-prd
  subnetaddressspace = var.subnetaddressspace-prd
  vnetname           = var.vnetname-prd
  location           = var.location-prd
  resourcegroupname  = var.resourcegroupname-prd
}

# Call Public IP module
module "publicip" {
  source = "./modules/public-ip"

  publicipname      = var.publicipname-prd
  location          = var.location-prd
  resourcegroupname = var.resourcegroupname-prd
}

# Call Network Interface module
module "networkinterface" {
  source = "./modules/network-interface"

  networkinterfacename = var.networkinterfacename-prd
  location             = var.location-prd
  resourcegroupname    = var.resourcegroupname-prd
}

# Call Network Security Group module
module "networksecuritygroup" {
  source = "./modules/network-security-group"

  nsgname           = var.nsgname-prd
  location          = var.location-prd
  resourcegroupname = var.resourcegroupname-prd
}

