data "azurerm_client_config" "current" {}

data "azurerm_service_plan" "this " {
  name                = var.function_app_service_plan.name
  resource_group_name = var.function_app_service_plan.resource_group_name
}

data "azurerm_key_vault" "this" {
  name                = var.key_vault.name
  resource_group_name = var.key_vault.resource_group_name
}

data "azurerm_key_vault_secret" "datadog_api_key" {
  name         = var.key_vault_secret_datadog_apikey_name
  key_vault_id = data.azurerm_key_vault.this.id
}

data "azurerm_key_vault_secret" "cmk_encryption_key" {
  name         = var.key_vault_secret_cmk_key_name
  key_vault_id = data.azurerm_key_vault.this.id
}