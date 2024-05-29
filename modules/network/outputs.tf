# Output variable definition

output "network-module-output-app-service-subnet-id" {
    description = "App Service Subnet ID"
    value = module.app-service-subnet.subnet-out-id
}