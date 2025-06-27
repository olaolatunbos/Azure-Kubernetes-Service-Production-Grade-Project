variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "virtual_network_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region location."
  type        = string
  default     = "UK South"
}

variable "environment" {
  description = "Deployment environment (e.g. dev, prod)."
  type        = string
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
}

variable "aks_name" {
  description = "Azure Kubernetes Service cluster name."
  type        = string
}

variable "rg_id" {
  description = "Resource Group ID (used for scope)"
  type        = string
}
