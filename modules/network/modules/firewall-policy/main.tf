# Resource definitions

# Firewall Policy
resource "azurerm_firewall_policy" "policy" {
    name = "example-fwpolicy"
    resource_group_name = var.policy-input-rg-name
    location = var.policy-input-location
}

# Firewall Policy Rule Collection
resource "azurerm_firewall_policy_rule_collection_group" "policy-collection" {
    name = "example-fwpolicy-rcg"
    firewall_policy_id = azurerm_firewall_policy.policy.id
    priority = "500"

    # Optional
    application_rule_collection {
        name     = "app_rule_collection1"
        priority = 500
        action   = "Deny"
        rule {
            name = "app_rule_collection1_rule1"
            protocols {
                type = "Http"
                port = 80
            }
            protocols {
                type = "Https"
                port = 443
            }
            source_addresses  = ["10.0.0.1"]
            destination_fqdns = ["*.microsoft.com"]
        }
    }

    # Optional
    network_rule_collection {
        name     = "network_rule_collection1"
        priority = 400
        action   = "Deny"
        rule {
            name                  = "network_rule_collection1_rule1"
            protocols             = ["TCP", "UDP"]
            source_addresses      = ["10.0.0.1"]
            destination_addresses = ["192.168.1.1", "192.168.1.2"]
            destination_ports     = ["80", "1000-2000"]
            }
    }

    # Optional
    # nat_rule_collection {
    #     name     = "nat_rule_collection1"
    #     priority = 300
    #     action   = "Dnat"
    #     rule {
    #         name                = "nat_rule_collection1_rule1"
    #         protocols           = ["TCP", "UDP"]
    #         source_addresses    = ["10.0.0.1", "10.0.0.2"]
    #         destination_address = "192.168.1.1"
    #         destination_ports   = ["80"]
    #         translated_address  = "192.168.0.1"
    #         translated_port     = "8080"
    #     }
    # }
}