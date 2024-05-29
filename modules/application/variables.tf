# Input variable definitions

# Network Module Resource Group Name
variable "application-module-input-rg-name" {
    description = "Resource group of application module"
    type = string
}

# Network Module Resource Group Name
variable "application-module-input-location" {
    description = "Location of application module"
    type = string
}

# App Service Subnet ID
variable "application-module-input-subnet-id" {
    description = "App service subnet ID"
    type = string
}