output "secret_id" {
  description = "The ID of the Key Vault secret."
  value       = azurerm_key_vault_secret.secret.id
}
output "value" {
  value = azurerm_key_vault_secret.secret.value
}