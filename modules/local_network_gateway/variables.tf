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

variable "peergatewayaddress" {
  type        = string
  description = "The name of azure Network Security Group."
}
variable "peerIpaddress" {
  type        = string
  description = "The name of azure Network Security Group."
}
