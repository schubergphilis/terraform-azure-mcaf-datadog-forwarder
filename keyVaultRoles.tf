resource "azurerm_role_assignment" "principal" {
  principal_id                     = data.azurerm_client_config.current.object_id
  scope                            = data.azurerm_key_vault.this.id
  role_definition_name             = "Key Vault Crypto User"
  skip_service_principal_aad_check = false
}