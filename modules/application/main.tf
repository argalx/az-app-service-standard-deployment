# Resource definitions

resource "azurerm_service_plan" "sp-windows-web-app" {
    name = "spwindows"
    resource_group_name = var.application-module-input-rg-name
    location = var.application-module-input-location
    sku_name = "P1v2"
    os_type = "Windows"
}

resource "azurerm_windows_web_app" "windows-web-app" {
    name = "agx-windows-web-app1"
    resource_group_name = var.application-module-input-rg-name
    location = var.application-module-input-location
    service_plan_id = azurerm_service_plan.sp-windows-web-app.id

    site_config {

    }
}