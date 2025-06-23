variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "resource_location" {
  description = "Location for the AKS cluster"
  type        = string
  default     = "East US"
}

variable "aks_subnet_id" {
  description = "ID of the subnet where the AKS cluster will be deployed"
  type        = string
}

variable "aks_node_count" {
  description = "Number of nodes in the AKS node pool"
  type        = number
  default     = 1
}

variable "aks_node_vm_size" {
  description = "VM size for the AKS nodes"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "role_assignment_scope" {
  description = "The scope at which the role assignment applies (e.g., resource group, subscription, or specific resource)"
  type        = string
}

variable "deployment_environment" {
  description = "Deployment environment (e.g., dev, test, prod)"
  type        = string
}
