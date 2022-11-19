# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.env}-${var.code}"
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = [var.cidr]
}

# Public Snet
resource "azurerm_subnet" "s_pub" {
  name                 = "snet-pub-${var.env}-${var.code}"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.vnet.address_space[0], 8, 1)]
}

# Private Snet
resource "azurerm_subnet" "s_pri" {
  name                 = "snet-pri-${var.env}-${var.code}"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.vnet.address_space[0], 8, 2)]
}
