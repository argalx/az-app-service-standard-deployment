# Resource definitions

# Route Table
resource "azurerm_route_table" "route-table" {
    name = "testRouteTable1"
    resource_group_name = var.route-input-rg-name
    location = var.route-input-location
}

# Optional
resource "azurerm_route" "route" {
    name = "testRoute1"
    resource_group_name = var.route-input-rg-name
    route_table_name = azurerm_route_table.route-table.name
    address_prefix = "10.1.0.0/16"
    next_hop_type = "VirtualAppliance"
    next_hop_in_ip_address = var.route-next-next_hop_in_ip_address
}