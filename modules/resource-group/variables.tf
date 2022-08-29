variable "environment" {
  type        = string
  description = ""
  default     = ""
}

variable "location-prd" {
  type        = string
  description = "The Azure Region where the Resource would be provisioned."
}

variable "resourcegroupname-prd" {
  type        = string
  description = "The Azure Resource Group Name."
}
