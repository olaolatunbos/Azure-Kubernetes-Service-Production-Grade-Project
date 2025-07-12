provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "vnet" {
  source                        = "./modules/virtual_network"
  virtual_network_name          = var.virtual_network_name
  subnet_name                   = var.subnet_name
  resource_location             = var.location
  resource_group_name           = var.rg_name
  deployment_environment        = var.environment
  virtual_network_address_space = var.virtual_network_address_space
  subnet_address_prefixes       = var.subnet_address_prefixes
  depends_on                    = [azurerm_resource_group.resource-group]
  tags                          = var.tags
}

module "dns-zone" {
  source              = "./modules/dns_zone"
  name                = var.dns_zone_name
  resource_group_name = var.rg_name
  tags                = var.tags
}

module "acr" {
  source              = "./modules/container_registry"
  name                = var.acr_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
  tags                = var.tags
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = module.aks.kubelet_identity
  role_definition_name = var.acr_role_definition_name
  scope                = module.acr.id
  depends_on           = [module.acr]
}

module "aks" {
  source                 = "./modules/kubernetes_cluster"
  aks_cluster_name       = var.aks_name
  aks_dns_prefix         = var.aks_dns_prefix
  deployment_environment = var.environment
  resource_group_name    = var.rg_name
  role_assignment_scope  = var.rg_id
  resource_location      = var.location
  aks_node_count         = var.aks_node_count
  aks_node_vm_size       = var.aks_node_vm_size
  aks_subnet_id          = module.vnet.subnet_id
  depends_on             = [module.vnet]
  tags                   = var.tags
}
