variable "location" {
  type        = string
  description = "Azure region for all resources"
  default     = "East US"
}

variable "environment" {
  type        = string
  description = "Environment name used in resource naming and tagging"
  default     = "dev"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the Virtual Network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefix" {
  type        = string
  description = "CIDR prefix for the subnet"
  default     = "10.0.1.0/24"
}

variable "vm_size" {
  type        = string
  description = "Azure VM SKU"
  default     = "Standard_B2s"
}

variable "admin_username" {
  type        = string
  description = "VM local administrator username"
  default     = "azureadmin"
}
