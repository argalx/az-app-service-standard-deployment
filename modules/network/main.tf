# Resource definitions

# Network Security Group Resource
# resource "azurerm_network_security_group" "nsg" {
#     name = var.nsg-input-name
#     resource_group_name = var.network-module-input-rg-name
#     location = var.network-module-input-location
# }

# Virtual Network Resource
resource "azurerm_virtual_network" "vnet" {
    name = var.vnet-input-name
    resource_group_name = var.network-module-input-rg-name
    location = var.network-module-input-location
    address_space = ["10.0.0.0/16"]
    dns_servers = ["10.0.0.4", "10.0.0.5"]
}

# Default Subnet
module "default-subnet" {
    source = "./modules/subnet"
    subnet-input-name = "default"
    subnet-input-rg-name = var.network-module-input-rg-name
    subnet-input-vnet-name = azurerm_virtual_network.vnet.name
    subnet-input-address_prefixes = ["10.0.1.0/24"]
    # subnet-nsg-assoc-input-nsg-id = azurerm_network_security_group.nsg.id
}

# Azure App Gateway Subnet
module "app-gateway-subnet" {
    source = "./modules/subnet"
    subnet-input-name = "app-gateway-subnet"
    subnet-input-rg-name = var.network-module-input-rg-name
    subnet-input-vnet-name = azurerm_virtual_network.vnet.name
    subnet-input-address_prefixes = ["10.0.2.0/24"]
    # subnet-nsg-assoc-input-nsg-id = azurerm_network_security_group.nsg.id
}

# Azure App Service Subnet
module "app-service-subnet" {
    source = "./modules/subnet"
    subnet-input-name = "app-service-subnet"
    subnet-input-rg-name = var.network-module-input-rg-name
    subnet-input-vnet-name = azurerm_virtual_network.vnet.name
    subnet-input-address_prefixes = ["10.0.3.0/24"]
    # subnet-nsg-assoc-input-nsg-id = azurerm_network_security_group.nsg.id
}

# Azure Cache for Redis Subnet
module "redis-cache-subnet" {
    source = "./modules/subnet"
    subnet-input-name = "redis-cache-subnet"
    subnet-input-rg-name = var.network-module-input-rg-name
    subnet-input-vnet-name = azurerm_virtual_network.vnet.name
    subnet-input-address_prefixes = ["10.0.4.0/24"]
    # subnet-nsg-assoc-input-nsg-id = azurerm_network_security_group.nsg.id
}

# Azure Firewall Subnet
module "firewall-subnet" {
    source = "./modules/subnet"
    subnet-input-name = "AzureFirewallSubnet"
    subnet-input-rg-name = var.network-module-input-rg-name
    subnet-input-vnet-name = azurerm_virtual_network.vnet.name
    subnet-input-address_prefixes = ["10.0.5.0/24"]
    # subnet-nsg-assoc-input-nsg-id = azurerm_network_security_group.nsg.id
}

# Private Link Subnet
module "private-link-subnet" {
    source = "./modules/subnet"
    subnet-input-name = "private-link-subnet"
    subnet-input-rg-name = var.network-module-input-rg-name
    subnet-input-vnet-name = azurerm_virtual_network.vnet.name
    subnet-input-address_prefixes = ["10.0.6.0/24"]
    # subnet-nsg-assoc-input-nsg-id = azurerm_network_security_group.nsg.id
}

# Firewall Public IP
module "firewall-public-ip" {
    source = "./modules/public-ip"
    pip-input-name = "firewallPip"
    pip-input-rg-name = var.network-module-input-rg-name
    pip-input-location = var.network-module-input-location
}

# Firewall Policy
module "firewall-policy" {
    source = "./modules/firewall-policy"
    policy-input-rg-name = var.network-module-input-rg-name
    policy-input-location = var.network-module-input-location
}

# Azure Firewall Resource
resource "azurerm_firewall" "firewall" {
    name = "agxfirewall"
    resource_group_name = var.network-module-input-rg-name
    location = var.network-module-input-location
    sku_name = "AZFW_VNet"
    sku_tier = "Standard"

    firewall_policy_id = module.firewall-policy.policy-output-id

    ip_configuration {
        name = "firewall-ip-configuration"
        subnet_id = module.firewall-subnet.subnet-out-id
        public_ip_address_id = module.firewall-public-ip.pip-output-id
    }
}

module "route-table" {
    source = "./modules/route-table"
    route-input-rg-name = var.network-module-input-rg-name
    route-input-location = var.network-module-input-location
    route-next-next_hop_in_ip_address = "10.0.5.4"
}