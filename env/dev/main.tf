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
  source = "../../modules/vm_win"

  location              = var.location
  env                   = var.env
  code                  = var.code
  cidr                  = var.cidr
  vm_win_size           = var.vm_win_size
  vm_win_login_username = var.vm_win_login_username
  vm_win_login_password = var.vm_win_login_password
  vm_win_img_publisher  = var.vm_win_img_publisher
  vm_win_img_offer      = var.vm_win_img_offer
  vm_win_img_sku        = var.vm_win_img_sku
  vm_win_img_version    = var.vm_win_img_version

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

module "lbe" {
  source = "../../modules/lbe"

  location = var.location
  env      = var.env
  code     = var.code
  cidr     = var.cidr

  rg_name = module.rg.rg_name
  vm_nic  = module.vm.vm_nic
}
