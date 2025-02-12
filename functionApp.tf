resource "azurerm_linux_function_app" "this" {
  location                      = var.location
  resource_group_name           = var.resource_group_name
  name                          = var.function_app_name
  service_plan_id               = var.function_app.service_plan_id
  virtual_network_subnet_id     = var.function_app.vnet_subnet_id
  storage_account_name          = var.storage_account.name
  storage_uses_managed_identity = true
  https_only                    = true

  app_settings = {
    "AzureWebJobsStorage__blobServiceUri" = module.storage_account.endpoints.primary_blob_endpoint
    "AzureWebJobsStorage__clientId"       = azurerm_user_assigned_identity.datadog_mid.client_id
    "AzureWebJobsStorage__credential"     = "managedidentity"
    "azeventhub__fullyQualifiedNamespace" = "${var.event_hub.namespace_name}.servicebus.windows.net"
    "azeventhub__clientId"                = azurerm_user_assigned_identity.datadog_mid.client_id
    "azeventhub__credential"              = "managedidentity"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = true
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE"     = true
    "WEBSITE_RUN_FROM_PACKAGE"            = 1
    "DD_SITE"                             = "datadoghq.eu"
    "DD_API_KEY"                          = data.azurerm_key_vault_secret.datadog_api_key.value
  }
  site_config {

  }
  tags = merge(
    try(var.tags),
    tomap({
      "Resource Type" = "Function App"
    })
  )
}

resource "azurerm_user_assigned_identity" "datadog_mid" {
  name                = var.managed_identity_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags = merge(
    try(var.tags),
    tomap({
      "Resource Type" = "Managed Identity"
    })
  )
}

resource "azurerm_application_insights" "appr_appi" {
  name                = var.application_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "Node.JS"
  retention_in_days   = 30
  tags = merge(
    try(var.tags),
    tomap({
      "Resource Type" = "Application Insights"
    })
  )
}
