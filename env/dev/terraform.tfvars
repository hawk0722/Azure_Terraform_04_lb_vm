# common
location = "japaneast"
env      = "dev"
code     = "<Your code>"

# vnet
cidr = "10.0.0.0/16"

# vm_win
vm_win_size           = "Standard_B1ms"
vm_win_login_username = "adminuser"
vm_win_login_password = "P@$$w0rd1234!"
vm_win_img_publisher  = "MicrosoftWindowsServer"
vm_win_img_offer      = "WindowsServer"
vm_win_img_sku        = "2022-Datacenter"
vm_win_img_version    = "latest"

# vm_linux
vm_linux_size           = "Standard_DS1_v2"
vm_linux_admin_username = "adminuser"
vm_linux_admin_password = "P@ssword@12345"
vm_linux_img_publisher  = "Canonical"
vm_linux_img_offer      = "0001-com-ubuntu-server-jammy"
vm_linux_img_sku        = "22_04-lts-gen2"
vm_linux_img_version    = "latest"
