output "storage_account_id" {
  value = var.storage_account != null ? module.storage_account[0].id : null
}

output "function_app_id" {
  value = azurerm_linux_function_app.this.id
}