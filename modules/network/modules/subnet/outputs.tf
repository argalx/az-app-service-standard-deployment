# Output variable definition

output "subnet-out-id" {
    description = "Subnet ID"
    value = azurerm_subnet.subnet.id
}