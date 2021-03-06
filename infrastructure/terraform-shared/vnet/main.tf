# Create virtual network
resource "azurerm_virtual_network" "main" {
  name                = "vnet-${var.appname}-${var.environment}"
  address_space       = ["10.100.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Create subnets

resource "azurerm_subnet" "aks" {
  name                 = "aks-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = "10.100.1.0/24"
}

resource "azurerm_subnet" "agents" {
  name                 = "agents-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = "10.100.2.0/24"
}
