variable "PROJECT" {}
variable "RESOURCE_GROUP" {}
variable "ENVIRONMENT" {}
variable "LOCATION" {}
variable "STORAGE_ACCOUNT_ID" {}

resource "azurerm_container_registry" "acr" {
  name                = "aci-${var.ENVIRONMENT}-${var.LOCATION}-test"
  resource_group_name = var.RESOURCE_GROUP
  location            = var.LOCATION
  storage_account_id  = var.STORAGE_ACCOUNT_ID
  sku                 = "Basic"
  admin_enabled       = false

  tags = {
    environment = var.ENVIRONMENT
    location    = var.LOCATION
    project     = var.PROJECT
    service     = "container_registry"
    serviceName = "aci-${var.ENVIRONMENT}-${var.LOCATION}-test"
  }
}