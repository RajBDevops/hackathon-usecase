variable "location" {
  type        = string
  description = "Azure region"
  default     = "East US"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}
