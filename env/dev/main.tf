module "rg" {
  source = "../../modules/rg"

  location = var.location
  env      = var.env
  code     = var.code
}

module "vnet" {
  source = "../../modules/vnet"

  location = var.location
  env      = var.env
  code     = var.code
  cidr     = var.cidr

  rg_name = module.rg.rg_name
}

module "vm" {
  source = "../../modules/vm"

  location = var.location
  env      = var.env
  code     = var.code
  cidr     = var.cidr

  rg_name  = module.rg.rg_name
  s_pri_id = module.vnet.s_pri_id
}

module "nsg" {
  source = "../../modules/nsg"

  location = var.location
  env      = var.env
  code     = var.code
  cidr     = var.cidr

  rg_name  = module.rg.rg_name
  s_pri_id = module.vnet.s_pri_id
}
