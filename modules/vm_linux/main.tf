# resource "azurerm_resource_group" "example" {
#   name     = "<Your resorce group name>"
#   location = "japaneast"
# }

# resource "azurerm_virtual_network" "example" {
#   name                = "example-network"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_subnet" "example" {
#   name                 = "internal"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.2.0/24"]
# }

resource "azurerm_network_interface" "nic" {
  name                = "nic-linux-${var.env}-${var.code}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "vm-linux-${var.env}-${var.code}-ip-configuration"
    subnet_id                     = var.s_pri_id
    private_ip_address_allocation = "Dynamic"
  }
}

locals {
  custom_data = <<EOF
    #!/bin/bash
    apt-get update
    apt-get -y dist-upgrade
    apt install -y nginx
    EOF
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-linux-${var.env}-${var.code}"
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_linux_size
  admin_username      = var.vm_linux_admin_username
  admin_password      = var.vm_linux_admin_password
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_linux_img_publisher
    offer     = var.vm_linux_img_offer
    sku       = var.vm_linux_img_sku
    version   = var.vm_linux_img_version
  }

  # Encode and pass you script https://sbulav.github.io/terraform/terraform-azurerm-compute-custom-data/
  custom_data = base64encode(local.custom_data)

}
