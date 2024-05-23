# Output variable definition

# Firewall Policy ID
output "policy-output-id" {
    description = "Firewall Policy ID"
    value = azurerm_firewall_policy.policy.id
}