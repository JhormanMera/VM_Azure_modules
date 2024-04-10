provider "azurerm" {
  features {}
}

# Crear el grupo de recursos
resource "azurerm_resource_group" "my_rg" {
  name     = "${var.prefix}-rg"
  location = var.location
}

# Crear una red virtual
resource "azurerm_virtual_network" "my_vnet" {
  name                = "${var.prefix}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.my_rg.name
}

# Crear la primera subred
resource "azurerm_subnet" "first_subnet" {
  name                 = "${var.prefix}-sn1"
  resource_group_name  = azurerm_resource_group.my_rg.name
  virtual_network_name = azurerm_virtual_network.my_vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

# Crear la segunda subred
resource "azurerm_subnet" "second_subnet" {
  name                 = "${var.prefix}-sn2"
  resource_group_name  = azurerm_resource_group.my_rg.name
  virtual_network_name = azurerm_virtual_network.my_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

module "vm" {
    source = "./modules/vm"
    prefix = var.prefix
    subnet-id = azurerm_subnet.first_subnet.id
    location = var.location
    user = var.user
    password = var.password
    depends_on = [
      azurerm_resource_group.my_rg,
      azurerm_virtual_network.my_vnet,
      azurerm_subnet.first_subnet,
      azurerm_subnet.second_subnet
  ]
}