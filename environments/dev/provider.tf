terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
#   # backend "azurerm" {
#   #   resource_group_name  = "chandra-rg"
#   #   storage_account_name = "bhushan123"
#   #   container_name       = "tfstate"
#   #   key                  = "dev-terraform.tfstate"

#   }
}

provider "azurerm" {
  features {}
  subscription_id = "fa3325aa-2291-472e-9d80-68f554038ffc"
}