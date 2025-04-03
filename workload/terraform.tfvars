tenant_id            = "Tenant ID"
subscription_id      = "Subscription ID"
kv_name              = "KartiKV"
translator_name      = "ktranslator"
secret_name          = "translatorsecret"
role_definition_name = "Key Vault Administrator"

sku_name                = "Basic"
# automation_account_name = "AutomationAccount"

# schedule = {
#   name       = "re-key-Schedule"
#   frequency  = "Hour"
#   interval   = 1
#   start_time = "2025-03-28T15:00:00Z" # UTC time
#   timezone   = "Asia/Kolkata"
# }

# runbook = {
#   name = "ps-runbook-1"
#   type = "PowerShell72"
# }
logicapp_name = "TranslatorKeyRotation"
logicapp_schedule = {
  interval   = 1
  frequency  = "Hour"
  timezone   = "Asia/Kolkata"
  start_time = "2025-03-31T11:30:00Z" # UTC time
}

