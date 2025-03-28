output "translator_api_key" {
  description = "API key stored in Key Vault"
  value       = module.keyvault.keyvault_id
}