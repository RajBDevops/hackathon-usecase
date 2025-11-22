variable "location" {
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  type = string
}

variable "aks_name" {
  type = string
}

variable "node_count" {
  type    = number
  default = 2
}

variable "vm_size" {
  type    = string
  default = "Standard_DS2_v2"
}
