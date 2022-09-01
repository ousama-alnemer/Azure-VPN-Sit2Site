variable "environment" {
  type        = string
  description = ""
  default     = ""
}

variable "location" {
  type        = string
  description = "The Azure Region where the Resource would be provisioned."
}

variable "resourcegroupname" {
  type        = string
  description = "The Azure Resource Group Name."
}

variable "vpngatewayname" {
  type        = string
  description = "The name of azure Virtual Network."
}

variable "skuvalue" {
  type        = string
  description = "The name of azure Virtual Network."
}

variable "subnetvpn" {
  type        = string
  description = "The name of azure Virtual Network."
}

variable "publicipname" {
  type        = string
  description = "The name of azure Virtual Network."
}
variable "type" {
  type        = string
  description = "The name of azure Virtual Network."
}

variable "subnetid" {
  type        = string
  description = "The name of azure Virtual Network."
}

variable "publicipid" {
}

resource "azurerm_public_ip" "publicip" {
  name                = var.publicipname
  location            = var.location
  resource_group_name = var.resourcegroupname
  allocation_method   = "Static"
  sku                 = "standard"
}