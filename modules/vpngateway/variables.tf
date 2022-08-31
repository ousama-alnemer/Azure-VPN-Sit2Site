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

#variable "publicipname" {
#  type        = string
#  description = "The name of azure Virtual Network."
#}
