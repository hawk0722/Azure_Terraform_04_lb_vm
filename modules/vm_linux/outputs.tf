output "vm_linux_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "vm_linux_nic" {
  value = azurerm_network_interface.nic.id
}
