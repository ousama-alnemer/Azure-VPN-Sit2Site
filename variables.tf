
variable "resourcegroupname" {
  type        = string
  description = "The azure resource group name in which windows virtual machine would be provisioned."
}

variable "vnetname" {
  type        = string
  description = "The name of azure Virtual Network."
}

variable "vnetaddressspace" {
  type        = string
  description = "The virtual network address space."
}

variable "subnetname" {
  type        = string
  description = "The name of azure SubNet."
}

variable "subnetaddressspace" {
  type        = string
  description = "The subnet address space."
}

variable "networkinterfacename" {
  type        = string
  description = "The name of azure network interface card."
}

variable "nsgname" {
  type        = string
  description = "The name of azure Network Security Group."
}

variable "publicipname" {
  type        = string
  description = "The name of the public ip address."
}

variable "peergatewayaddress" {
  type        = string
  description = "The peer network gateway."
}
variable "peerIpaddressrange" {
  type        = string
  description = "The peer network range."
}

variable "location" {
  type        = string
  description = "The azure region where the resource would be provisioned."
}


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


