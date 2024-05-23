# Input variable definitions

# Resource Group
variable "route-input-rg-name" {
    description = "Resource group of route table."
    type = string
}

# Location
variable "route-input-location" {
    description = "Location of route table."
    type = string
}

# Virtual Appliance (Firewall) Private IP
variable "route-next-next_hop_in_ip_address" {
    description = "Azure firewall private ip address"
    type = string
}