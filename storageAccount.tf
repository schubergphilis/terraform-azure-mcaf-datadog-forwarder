module "storage_account" {
  source = "github.com/schubergphilis/terraform-azure-mcaf-storage-account.git?ref=v0.7.0"

  name                              = var.storage_account.name
  location                          = var.location
  resource_group_name               = var.resource_group_name
  account_tier                      = var.storage_account.account_tier
  account_replication_type          = var.storage_account.account_replication_type
  account_kind                      = "StorageV2"
  access_tier                       = var.storage_account.access_tier
  infrastructure_encryption_enabled = var.storage_account.infrastructure_encryption_enabled
  cmk_key_vault_id                  = var.storage_account.cmk_key_vault_id
  cmk_key_name                      = var.storage_account.cmk_key_name
  system_assigned_identity_enabled  = var.storage_account.system_assigned_identity_enabled
  user_assigned_identities          = list(azurerm_user_assigned_identity.datadog_mid.id)
  immutability_policy               = var.storage_account.immutability_policy
  tags = merge(
    try(var.tags),
    tomap({
      "Resource Type" = "Storage Account"
    })
  )
}