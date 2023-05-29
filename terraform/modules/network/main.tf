provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "network" {
  name                = "aksnetwork"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = var.resource_group_name
  location = var.location
}

resource "azurerm_subnet" "ingress" {
  name = "ingress"
  resource_group_name = azurerm_virtual_network.network.resource_group_name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes =  ["10.0.0.0/28"]
}

resource "azurerm_subnet" "dataplane" {
  name = "dataplane"
  resource_group_name = azurerm_virtual_network.network.resource_group_name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes = ["10.0.128.0/17"]
}
