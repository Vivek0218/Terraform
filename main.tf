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
  use_msi = true
  subscription_id = "a22c09bc-5167-4466-b7ef-d15f092a8b94"
  tenant_id = "4d998499-a954-43fe-9f1e-8c593eea1fe1"
}

# Create a resource group
resource "azurerm_resource_group" "demo01" {
  name     = "terraform_rg"
  location = "West Europe"
}

# Create a Virtual Network
resource "azurerm_virtual_network" "vnet01" {
  name = "test_vnet01"
  resource_group_name = azurerm_resource_group.demo01.name
  location = azurerm_resource_group.demo01.location
  address_space = ["10.10.0.0/16"]

  subnet {
    name = "sub01"
    address_prefix = "10.10.1.0/24"
  }
}