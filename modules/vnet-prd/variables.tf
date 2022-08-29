


variable "azurerm_resource_group" {
  type        = string
  description = "The azure resource group name in which windows virtual machine would be provisioned."
}

variable "name" {
  type        = string
  description = "The name of azure Virtual Network."
}

variable "address_prefix" {
  type        = string
  description = "The virtual network address space."
}

variable "subnet" {
  type        = string
  description = "The name of azure SubNet."
}


variable "security_group" {
  type        = string
  description = "The name of azure Network Security Group."
}


