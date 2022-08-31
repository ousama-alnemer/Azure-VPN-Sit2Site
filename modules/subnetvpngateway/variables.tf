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

variable "subnetnamevpn" {
  type        = string
  description = "The Azure Subnet name."
}

variable "subnetaddressvpn" {
  type        = string
  description = "The Azure Subnet address space."
}


variable "vnetname" {
  type        = string
  description = "The name of azure Virtual Network."
}
