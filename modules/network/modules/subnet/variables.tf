# Input variable definitions

# Subnet Name
variable "subnet-input-name" {
    description = "Name of subnet. Must be unique."
    type = string
}

# Subnet Resource Group
variable "subnet-input-rg-name" {
    description = "Resoure group of subnet."
    type = string
}

# Subnet Location
variable "subnet-input-vnet-name" {
    description = "Virtual network name."
    type = string
}

# Subnet Address Prefix
variable "subnet-input-address_prefixes" {
    description = "Subnet address prefix."
    type = list(string)
}

# Network Security Group ID
variable "subnet-nsg-assoc-input-nsg-id" {
    description = "Network security group ID"
    type = string
}