resource "azurerm_role_assignment" "datadog_mid" {
  principal_id                     = azurerm_user_assigned_identity.datadog_mid.principal_id
  scope                            = data.azurerm_storage_account.this.id
  role_definition_name             = "Storage Blob Data Contributor"
  skip_service_principal_aad_check = false
}