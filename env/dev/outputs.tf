# Output to terminal screen.
output "rg_name" {
  value = module.rg.rg_name
}

output "vnet_name" {
  value = module.vnet.vnet_name
}

output "nsg_name" {
  value = module.nsg.nsg_name
}

output "vm_name" {
  value = module.vm.vm_name
}

output "lbe_name" {
  value = module.lbe.lbe_name
}
