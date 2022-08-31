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

variable "skutier" {
  type        = string
  description = "The Azure tier."
}

variable "skuname" {
  type        = string
  description = "The sku."
}


variable "vnetname" {
  type        = string
  description = "The name of azure Virtual Network."
}

variable "firewallname" {
  type        = string
  description = "The name of firewall."
}


