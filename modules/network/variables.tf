# Input variable definitions

# Network Module Resource Group Name
variable "network-module-input-rg-name" {
    description = "Resource group of network module"
    type = string
}

# Network Module Resource Group Name
variable "network-module-input-location" {
    description = "Location of network module"
    type = string
}

# Network Security Group Name
variable "nsg-input-name" {
    description = "Name of network security group. Must be unique."
    type = string
}

# Virtual Network Name
variable "vnet-input-name" {
    description = "Name of virtual network. Must be unique."
    type = string
}

# Virtual Network Address Space
# variable "vnet-input-address-space" {
#     description = "Virtual network address space."
#     type = list(string)
# }

# Virtual Network DNS Servers
# variable "vnet-input-dns-servers" {
#     description = "Virtual network dns servers."
#     type = list(string)
# }