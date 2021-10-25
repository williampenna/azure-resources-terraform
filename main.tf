resource "azurerm_resource_group" "rg" {
  name     = "${var.PROJECT}-${var.ENVIRONMENT}-${var.LOCATION}-rg"
  location = var.LOCATION
}

resource "azurerm_storage_account" "sa" {
  name                     = "${var.PROJECT}sa${var.ENVIRONMENT}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.LOCATION
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_storage_container" "sc" {
  name                  = "${var.PROJECT}-${var.ENVIRONMENT}-${var.LOCATION}-sc"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"

  depends_on = [azurerm_resource_group.rg]
}

module "container_registry" {
  source                = "./modules/container_registry"
  
  PROJECT               = var.PROJECT
  ENVIRONMENT           = var.ENVIRONMENT
  LOCATION              = var.LOCATION
  RESOURCE_GROUP        = azurerm_resource_group.rg.name
  STORAGE_ACCOUNT_ID    = azurerm_storage_account.sa.id

  depends_on            = [azurerm_resource_group.rg]
}
