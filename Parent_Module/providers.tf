terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-fruit"
    storage_account_name = "storagefruit"
    container_name       = "fruit-container"
    key                  = "fruit.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
