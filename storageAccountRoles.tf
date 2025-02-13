resource "azurerm_role_assignment" "datadog_mid_sta_blob" {
  principal_id                     = azurerm_user_assigned_identity.datadog_mid.principal_id
  scope                            = module.storage_account.this.id
  role_definition_name             = "Storage Blob Data Contributor"
  skip_service_principal_aad_check = false
}

resource "azurerm_role_assignment" "datadog_mid_sta_file" {
  principal_id                     = azurerm_user_assigned_identity.datadog_mid.principal_id
  scope                            = module.storage_account.this.id
  role_definition_name             = "Storage File Data Privileged Contributor"
  skip_service_principal_aad_check = false
}

resource "azurerm_role_assignment" "datadog_mid_sta_queue" {
  principal_id                     = azurerm_user_assigned_identity.datadog_mid.principal_id
  scope                            = module.storage_account.this.id
  role_definition_name             = "Storage Queue Data Contributor"
  skip_service_principal_aad_check = false
}

resource "azurerm_role_assignment" "datadog_mid_sta_table" {
  principal_id                     = azurerm_user_assigned_identity.datadog_mid.principal_id
  scope                            = module.storage_account.this.id
  role_definition_name             = "Storage Table Data Contributor"
  skip_service_principal_aad_check = false
}