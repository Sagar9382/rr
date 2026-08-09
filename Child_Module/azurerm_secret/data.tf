data "azurerm_key_vault" "kv" {
  for_each = var.secrets

  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}