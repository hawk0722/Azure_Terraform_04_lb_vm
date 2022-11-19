output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "s_pri_id" {
  value = azurerm_subnet.s_pri.id
}
