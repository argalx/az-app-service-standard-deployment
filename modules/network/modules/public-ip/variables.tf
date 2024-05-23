# Input variable definitions

# Public IP Name
variable "pip-input-name" {
    description = "Name of public ip. Must be unique."
    type = string
}

# Resource Group
variable "pip-input-rg-name" {
    description = "Resource group of public ip."
    type = string
}

# Location
variable "pip-input-location" {
    description = "Location of public ip."
    type = string
}