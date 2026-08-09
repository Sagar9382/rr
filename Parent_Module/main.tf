module "azurerm_resource_group" {
  source = "../Child_Module/azurerm_resource_group"
  rg     = var.rgmonday
}

module "azurerm_storage_account" {
  depends_on = [module.azurerm_resource_group]
  source     = "../Child_Module/azurerm_storage_account"
  storage    = var.store
}

module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../Child_Module/azurerm_virtual_network"
  vnet       = var.virtualnetwork
}

module "azurerm_subnet" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../Child_Module/azurerm_subnet"
  subnet     = var.snet
}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../Child_Module/azurerm_public_ip"
  pip        = var.pip_parent

}

module "azurerm_network_interface" {
  depends_on = [module.azurerm_subnet]
  source     = "../Child_Module/azurerm_nic"
  nic        = var.nic_parent
}

module "azurerm_linux_virtual_machine" {
  depends_on = [module.azurerm_network_interface]
  source     = "../Child_Module/azurerm_virtual_machine"
  vm         = var.vm_parent
}

module "azurerm_key_vault" {
  depends_on = [module.azurerm_resource_group]
  source     = "../Child_Module/azurerm_keyvault"
  key        = var.key_parent
}

module "azurerm_key_vault_secret" {
  depends_on = [module.azurerm_key_vault]
  source     = "../Child_Module/azurerm_secret"
  secrets    = var.secrets_parent

}