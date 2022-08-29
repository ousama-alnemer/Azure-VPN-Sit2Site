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
module "vnet-prd" {
  source = "./modules/vnet-prd"

 # vnetname          = "${var.vnetname}
  #vnetaddressspace  = var.vnetaddressspace
  location          = module.vnet-prd.azurerm_resource_group.example.location
  resourcegroupname = module.vnet-prd.azurerm_resource_group.example.name
}
