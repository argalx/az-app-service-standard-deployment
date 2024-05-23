# Output variable definition

output "pip-output-id" {
    description = "Public IP ID"
    value = azurerm_public_ip.pip.id
}