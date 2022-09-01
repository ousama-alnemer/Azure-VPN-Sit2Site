variable "applicationname" {
  type        = string
  description = "The name of the application."
}

variable "increment" {
  type        = string
  description = "The increment number to be postfixed in the resource name."
}

variable "environment" {
  type        = string
  description = "The ALM environment (dev, test, prod) in which resources are beign deployed."
}

variable "location" {
  type        = string
  description = "The azure region where the resource would be provisioned."
}

variable "locationacronym" {
  type        = string
  description = "The short name of azure region where the resource would be provisioned."
}

variable "resourcegroupname" {
  type        = string
  description = "The azure resource group name in which windows virtual machine would be provisioned."
}

variable "subnetname" {
  type        = string
  description = "The name of azure SubNet."
}

variable "subnetid" {
  type        = string
  default     = ""
  description = "The id of azure SubNet."
}

variable "subnetaddressspace" {
  type        = string
  description = "The subnet address space."
}

variable "networkinterfacename" {
  type        = string
  description = "The name of azure network interface card."
}

variable "networkinterfaceid" {
  type        = string
  description = "The id of azure network interface card."
}

variable "nsgname" {
  type        = string
  description = "The name of azure Network Security Group."
}

variable "nsgid" {
  type        = string
  description = "The id of azure Network Security Group."
}

variable "publicipname" {
  type        = string
  description = "The name of the public ip address."
}

variable "publicipid" {
  type        = string
  description = "The id of the public ip address."
} 
  

variable "peeraddressspace" {
  type        = string
  description = "The peer address would be provisioned."
}

variable "peergatewayaddress" {
  type        = string
  description = "The Azure Virtual Network address space would be provisioned."
}

variable "peervnetgetwayname" {
  type        = string
  description = "The Azure Virtual Network address space would be provisioned."
}

variable "subnetnamevpn" {
  type        = string
  description = "The Azure Virtual Network address space would be provisioned."
}

variable "subnetaddressvpn" {
  type        = string
  description = "The Azure Virtual Network address space would be provisioned."
}

variable "privateip" {
  type        = string
  description = "The Azure Virtual Network address space would be provisioned."
}

variable "vpngatewayname" {
  type        = string
  description = "The Azure Virtual Network address space would be provisioned."
}


variable "skuvalue" {
  type        = string
  description = "The Azure Virtual Network address space would be provisioned."
}

variable "vnetaddressspace" {
  type        = string
  description = "The Azure Virtual Network address space would be provisioned."
}

variable "vnetname" {
  type        = string
  description = "The Azure Virtual Network address space would be provisioned."
}

