locals {
  body_key = jsonencode({
    "KeyName" = "Key1",
  })
  add_key = jsonencode({
    "value" = "@body('Store_Key')?['key1']",
  })

  AI_uri = "https://management.azure.com/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.CognitiveServices/accounts/${var.translator_name}/regenerateKey?api-version=2024-10-01"

  KV_uri = "https://${var.key_vault_name}.vault.azure.net/secrets/${var.secret_name}?api-version=7.2"

  Del_Uri = "https://${var.key_vault_name}.vault.azure.net/deletedsecrets/${var.secret_name}?api-version=7.2"

}