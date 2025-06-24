provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "resource-group" {
  name     = "2048-game-prod-uksouth-rg"
  location = "UK South"
}

module "vnet" {
  source                        = "./modules/virtual_network"
  virtual_network_name          = var.virtual_network_name
  subnet_name                   = var.subnet_name
  resource_location             = var.location
  resource_group_name           = var.rg_name
  deployment_environment        = var.environment
  virtual_network_address_space = ["10.1.0.0/16"]
  subnet_address_prefixes       = ["10.1.1.0/24"]
  depends_on                    = [azurerm_resource_group.resource-group]
}

module "acr" {
  source              = "./modules/container_registry"
  name                = var.acr_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = module.aks.kubelet_identity
  role_definition_name = "AcrPull"
  scope                = module.acr.id
  depends_on           = [module.acr]
}

module "aks" {
  source                 = "./modules/kubernetes_cluster"
  aks_cluster_name       = var.aks_name
  aks_dns_prefix         = "aksprod"
  deployment_environment = var.environment
  resource_group_name    = var.rg_name
  role_assignment_scope  = var.rg_id
  resource_location      = var.location
  aks_node_count         = 2
  aks_node_vm_size       = "Standard_DS2_v2"
  aks_subnet_id          = module.vnet.subnet_id
  depends_on             = [module.vnet]
}



