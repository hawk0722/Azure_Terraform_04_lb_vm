# common
variable "location" {
  type = string
}
variable "env" {
  type = string
}
variable "code" {
  type = string
}

# vnet
variable "cidr" {
  type = string
}

# vm_win
variable "vm_win_size" {
  type = string
}
variable "vm_win_login_username" {
  type = string
}
variable "vm_win_login_password" {
  type = string
}
variable "vm_win_img_publisher" {
  type = string
}
variable "vm_win_img_offer" {
  type = string
}
variable "vm_win_img_sku" {
  type = string
}
variable "vm_win_img_version" {
  type = string
}

# vm_linux

variable "vm_linux_size" {
  type = string
}
variable "vm_linux_admin_username" {
  type = string
}
variable "vm_linux_admin_password" {
  type = string
}
variable "vm_linux_img_publisher" {
  type = string
}
variable "vm_linux_img_offer" {
  type = string
}
variable "vm_linux_img_sku" {
  type = string
}
variable "vm_linux_img_version" {
  type = string
}
