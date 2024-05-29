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
    vnet-input-name = "agxvnet"
}

module "application-module" {
    source = "./modules/application"
    application-module-input-rg-name = azurerm_resource_group.resource-group1.name
    application-module-input-location = azurerm_resource_group.resource-group1.location
    application-module-input-subnet-id = module.network-module.network-module-output-app-service-subnet-id
}