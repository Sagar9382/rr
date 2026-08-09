rgmonday = {
  rg1 = {
    name     = "tom"
    location = "eastus"
  }
}

store = {
  store1 = {
    name                     = "doubleapple"
    resource_group_name      = "tom"
    location                 = "eastus"
    account_replication_type = "LRS"
    account_tier             = "Standard"
  }
}


virtualnetwork = {
  vnet1 = {
    name                = "apple-vnet"
    resource_group_name = "tom"
    location            = "eastus"
    address_space       = ["10.0.0.0/16"]
  }
}



snet = {
  subnet1 = {
    name                 = "mango-subnet"
    resource_group_name  = "tom"
    virtual_network_name = "apple-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet2 = {
    name                 = "mango-subnet"
    resource_group_name  = "tom"
    virtual_network_name = "apple-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}



pip_parent = {
  pip1 = {
    pip_name   = "my_pip"
    rg_name    = "tom"
    location   = "eastus"
    allocation = "Static"
  }


}


nic_parent = {
  nic_parent1 = {
    nic_name  = "applenic"
    location  = "eastus"
    rg_name   = "tom"
    snet_name = "mango-subnet"
    vnet_name = "apple-vnet"
    pip_name  = "my_pip"

  }



}

vm_parent = {
  vm_parent1 = {
    vm_name        = "example-machine"
    rg_name        = "tom"
    location       = "eastus"
    size           = "Standard_D2ds_v7"
    admin_username = "adminuser"
    password       = "sagarvm@123"
    caching        = "ReadWrite"
    storage        = "Standard_LRS"
    publisher      = "Canonical"
    offer          = "0001-com-ubuntu-server-jammy"
    sku            = "22_04-lts-gen2"
    version        = "latest"
    nic_name       = "applenic"

  }

}


key_parent ={
  vault_key ={
  key_vault_name = "apple-keyvault"
  location = "eastus"
  rg_name = "tom"
  sku = "standard"
}
}

secrets_parent ={
  secret1 ={
     keyvault_name = "apple-keyvault"
     rg_name       = "tom"
     secret_name  = "vm-password"
     secret_value = "sagarvm@123"
  }
}