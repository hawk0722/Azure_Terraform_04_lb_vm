resource "azurerm_network_interface" "nic" {
  name                = "nic-${var.env}-${var.code}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "vm-${var.env}-${var.code}-ip-configuration"
    subnet_id                     = var.s_pri_id
    private_ip_address_allocation = "Dynamic"
  }
}
