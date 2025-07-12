# Create the AKS cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_dns_prefix

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  default_node_pool {
    name           = "default"
    node_count     = var.aks_node_count
    vm_size        = var.aks_node_vm_size
    vnet_subnet_id = var.aks_subnet_id
    type           = "VirtualMachineScaleSets"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks_managed_identity.id]
  }

  tags = var.tags
}

resource "azurerm_user_assigned_identity" "aks_managed_identity" {
  name                = "aks-managed-identity"
  resource_group_name = var.resource_group_name
  location            = var.resource_location
}

resource "azurerm_role_assignment" "network_contributor" {
  scope                = var.role_assignment_scope
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_managed_identity.principal_id
}
