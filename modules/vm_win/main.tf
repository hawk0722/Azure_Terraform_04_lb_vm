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

resource "azurerm_windows_virtual_machine" "vm" {
  name                = "vm-${var.env}-${var.code}"
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_win_size
  admin_username      = var.vm_win_login_username
  admin_password      = var.vm_win_login_password
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_win_img_publisher
    offer     = var.vm_win_img_offer
    sku       = var.vm_win_img_sku
    version   = var.vm_win_img_version
  }
}

resource "azurerm_virtual_machine_extension" "vm_extension" {
  name                 = "vm_extension_install_iis"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
 {
  "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeManagementTools -IncludeAllSubFeature"
 }
SETTINGS

}
