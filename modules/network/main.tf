# Resource definitions

# Network Security Group Resource
resource "azurerm_network_security_group" "nsg" {
    name = var.nsg-input-name
    resource_group_name = var.network-module-input-rg-name
    location = var.network-module-input-location
}

# Virtual Network Resource
resource "azurerm_virtual_network" "vnet" {
    name = var.vnet-input-name
    resource_group_name = var.network-module-input-rg-name
    location = var.network-module-input-location
    address_space = ["10.0.0.0/16"]
    dns_servers = ["10.0.0.4", "10.0.0.5"]
}

module "default-subnet" {
    source = "./modules/subnet"
    subnet-input-name = "default"
    subnet-input-rg-name = var.network-module-input-rg-name
    subnet-input-vnet-name = azurerm_virtual_network.vnet.name
    subnet-input-address_prefixes = ["10.0.1.0/24"]
    subnet-nsg-assoc-input-nsg-id = azurerm_network_security_group.nsg.id
}