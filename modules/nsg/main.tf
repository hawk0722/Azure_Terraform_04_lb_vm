resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${var.env}-${var.code}"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_rule" "nsg_rule" {
  name                        = "AllowHttpInbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = var.s_pri_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
