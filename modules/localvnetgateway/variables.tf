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

variable "peeraddressspace" {
  type        = string
  description = "The peer address would be provisioned."
}

variable "localgatewayaddress" {
  type        = string
  description = "The Azure Virtual Network address space would be provisioned."
}
