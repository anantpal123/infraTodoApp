terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "chandra-rg"
    storage_account_name = "bhushan123"
    container_name       = "tfstate"
    key                  = "dev-terraform.tfstate"

  }
}

provider "azurerm" {
  features {}
  subscription_id = "9ea53555-e829-4a44-979e-046e7d148cb5"
}