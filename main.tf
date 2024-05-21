# Resource definitions

provider "azurerm" {
    features {
    }
}

resource "azurerm_resource_group" "resource-group1" {
    name = "agxtest-rg"
    location = "Australia East"
}

module "network-module" {
    source = "./modules/network"
    network-module-input-rg-name = azurerm_resource_group.resource-group1.name
    network-module-input-location = azurerm_resource_group.resource-group1.location
    nsg-input-name = "agxnsg"
    vnet-input-name = "agxvnet"
}