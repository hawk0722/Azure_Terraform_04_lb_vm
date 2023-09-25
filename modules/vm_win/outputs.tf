output "vm_win_name" {
  value = azurerm_windows_virtual_machine.vm.name
}

output "vm_win_nic" {
  value = azurerm_network_interface.nic.id
}
