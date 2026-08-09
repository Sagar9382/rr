resource "azurerm_linux_virtual_machine" "vm" {
  for_each              = var.vm
  name                  = each.value.vm_name
  resource_group_name   = each.value.rg_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = each.value.admin_username
  network_interface_ids = [data.azurerm_network_interface.example[each.key].id]


  admin_password = each.value.password

  disable_password_authentication = false

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }


}