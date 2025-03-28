output "translator_api_key" {
  description = "API key for the Translator service"
  value       = azurerm_cognitive_account.translator.primary_access_key
}
output "translator_identity_principal_id" {
  description = "The Principal ID of the Translator service's Managed Identity"
  value       = azurerm_cognitive_account.translator.identity[0].principal_id
}
output "translator_id" {
  description = "The ID of the Translator service"
  value       = azurerm_cognitive_account.translator.id
}