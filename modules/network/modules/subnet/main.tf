# Resource definitions

# Subnet Resource
resource "azurerm_subnet" "subnet" {
    name = var.subnet-input-name
    resource_group_name = var.subnet-input-rg-name
    virtual_network_name = var.subnet-input-vnet-name
    address_prefixes = var.subnet-input-address_prefixes
}

# Subnet Network Security Group Association
# resource "azurerm_subnet_network_security_group_association" "subnet-nsg-assoc" {
#     subnet_id = azurerm_subnet.subnet.id
#     network_security_group_id = var.subnet-nsg-assoc-input-nsg-id
# }