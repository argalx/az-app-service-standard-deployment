# Resource definitions

# Public IP Resource
resource "azurerm_public_ip" "pip" {
    name = var.pip-input-name
    resource_group_name = var.pip-input-rg-name
    location = var.pip-input-location
    allocation_method = "Static"
    sku = "Standard"
}