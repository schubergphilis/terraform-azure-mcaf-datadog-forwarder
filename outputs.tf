output "storage_account_id" {
  value = var.storage_account != null ? module.storage_account.id : null
}

output "eventhub_namespace_id" {
  value = azurerm_eventhub_namespace.this.id
}

output "function_app_id" {
  value = azurerm_linux_function_app.this.id
}