
variable "location" {
  type        = string
  description = "The Azure Region where the Resource would be provisioned."
}

variable "resourcegroupname" {
  type        = string
  description = "The Azure Resource Group Name."
}

variable "nsgname" {
  type        = string
  description = "The name of azure Network Security Group."
}
