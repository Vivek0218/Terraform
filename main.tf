# Define the Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "demo01" {
  name     = "terraform_rg"
  location = "West Europe"
}

# Create a Virtual Network
resource "azurerm_virtual_network" "vnet01" {
  name = ""
  resource_group_name = azurerm_resource_group.demo01.name
  location = azurerm_resource_group.demo01.location
  address_space = "10.10.0.0/16"
}