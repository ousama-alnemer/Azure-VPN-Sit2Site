variable "location-prd" {
  type        = string
  description = "The Azure Region where the Resource would be provisioned."
}

variable "resourcegroupname-prd" {
  type        = string
  description = "The Azure Resource Group Name."
}

variable "vnetname-prd" {
  type        = string
  description = "The Azure Virtual Network name."
}

variable "vnetaddressspace-prd" {
  type        = string
  description = "The Azure Virtual Network address space."
}
