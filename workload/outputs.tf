output "translator_api_key" {
  description = "API key stored in Key Vault"
  value       = module.translator_secret.value
  sensitive = true
}