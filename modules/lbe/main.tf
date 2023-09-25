resource "azurerm_public_ip" "pip" {
  name                = "pip-${var.env}-${var.code}-lbe"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lbe" {
  name                = "lbe-${var.env}-${var.code}"
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "pip-${var.env}-${var.code}-lbe-configuration"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lbe_backend_pool" {
  loadbalancer_id = azurerm_lb.lbe.id
  name            = "lbe-${var.env}-${var.code}-backend-pool"
}

# Connect backend pool and nic of vm.
resource "azurerm_network_interface_backend_address_pool_association" "lbe_backend_pool_association_win" {
  network_interface_id    = var.vm_win_nic
  ip_configuration_name   = "vm-win-${var.env}-${var.code}-ip-configuration"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lbe_backend_pool.id
}

resource "azurerm_lb_probe" "lbe_probe" {
  loadbalancer_id = azurerm_lb.lbe.id
  name            = "http-running-probe"
  port            = 80
}

resource "azurerm_lb_rule" "lbe_rule" {
  loadbalancer_id                = azurerm_lb.lbe.id
  name                           = "lbe-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "pip-${var.env}-${var.code}-lbe-configuration"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lbe_backend_pool.id]
  probe_id                       = azurerm_lb_probe.lbe_probe.id
}
