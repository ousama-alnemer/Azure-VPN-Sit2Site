
variable "location-prd" {
  type        = string
  description = "The Azure Region where the Resource would be provisioned."
}

variable "resourcegroupname-prd" {
  type        = string
  description = "The Azure Resource Group Name."
}

variable "subnetname-prd" {
  type        = string
  description = "The Azure Subnet name."
}

variable "subnetaddressspace-prd" {
  type        = string
  description = "The Azure Subnet address space."
}

variable "vnetname-prd" {
  type        = string
  description = "The name of azure Virtual Network."
}
