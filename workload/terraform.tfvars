tenant_id            = "tenant_id"
subscription_id = "sub_id"
kv_name              = "KartiKV"
translator_name      = "ktranslator"
secret_name          = "translatorsecret"
role_definition_name = "Key Vault Administrator"
filepath = "${path.module}/regen.ps1" # Path to the PowerShell script
sku_name                = "Basic"
automation_account_name = "AutomationAccount"

schedule = {
  name       = "re-key-Schedule"
  frequency  = "Hour"
  interval   = 1
start_time = "2025-03-28T15:00:00Z" # UTC time
  timezone   = "Asia/Kolkata"
}

runbook = {
  name = "ps-runbook-1"
  type = "PowerShell72"
#   path = "${path.module}/regen.ps1" # Path to the PowerShell script
}

