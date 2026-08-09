data "azurerm_subnet" "example" {
    for_each = var.nic
  name                 = each.value.snet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "example" {
    for_each = var.nic
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
