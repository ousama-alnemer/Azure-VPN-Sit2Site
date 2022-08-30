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

variable "tier_name" {
  type        = string
  description = "The Azure tier."
}

variable "sku_name" {
  type        = string
  description = "The sku."
}


variable "vnetname" {
  type        = string
  description = "The name of azure Virtual Network."
}
