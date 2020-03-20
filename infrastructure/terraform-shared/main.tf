# For suggested naming conventions, refer to:
#   https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging

module "acr" {
  source = "./acr"
  aks_name = var.acr_name
  resource_group_name = var.resource_group
  location = var.location
}

module "vnet" {
  source = "./vnet"
  vnet_name = var.vnet_name
  resource_group_name = var.resource_group
  location = var.location
}

module "devops-agent" {
  source = "./devops-agent"
  appname = var.appname
  environment = var.environment
  location = var.location
  resource_group_name = var.resource_group
  az_devops_url = var.az_devops_url
  az_devops_pat = var.az_devops_pat
  az_devops_agent_pool = var.az_devops_agent_pool
  az_devops_agents_per_vm = var.az_devops_agents_per_vm
  az_devops_agent_sshkeys = var.az_devops_agent_sshkeys
  az_devops_agent_vm_size = var.az_devops_agent_vm_size
  az_devops_agent_vm_count = var.az_devops_agent_vm_count
  az_devops_agent_vm_shutdown_time = var.az_devops_agent_vm_shutdown_time
}

module "aks" {
  source = "./aks"
  aks_name = var.aks_name
  aks_version = var.aks_version
  resource_group_name = var.resource_group
  location = var.location
  subnet_id = module.vnet.aks_subnet_id
  aks_sp_client_id = var.aks_sp_client_id
  aks_sp_object_id = var.aks_sp_object_id
  aks_sp_client_secret = var.aks_sp_client_secret
}

module "kusto" {
  source = "./kusto"
  kusto_name = var.kusto_name
  resource_group_name = var.resource_group
  location = var.location
  kusto_admin_sp_object_id = var.kusto_admin_sp_object_id
}
