variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}
variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}
variable "kv_name" {
  description = "Name of the Key Vault"
  type        = string
}
variable "translator_name" {
  description = "Name of the Translator service"
  type        = string
}
variable "secret_name" {
  description = "The name of the secret to store in the Key Vault."
  type        = string
}
variable "role_definition_name" {
  description = "The value of the secret to store in the Key Vault."
  type        = string
}
variable "sku_name" {
  type        = string
  description = "SKU name for the Automation Account (e.g., Basic, Free)"
}
variable "logicapp_name" {
  description = "Name of the Logic App workflow"
  type        = string
}
variable "logicapp_schedule" {
  type = object({
    interval   = number
    frequency  = string
    timezone   = string
    start_time = string
  })
  description = "Schedule configuration for the Logic App"
}
# variable "automation_account_name" {
#   type        = string
#   description = "Name of the Azure Automation Account"
# }
# variable "runbook" {
#   type = object({
#     name = string,
#     type = string, # Type of the runbook (e.g., PowerShell, Python)
#   })
# }
# variable "schedule" {
#   type = object({
#     name       = string, # Name of the schedule
#     frequency  = string, # Frequency of the schedule (e.g., OneTime, Hour, Day, Week, Month)
#     interval   = number, # Interval for the schedule
#     start_time = string, # Start time of the schedule in UTC (e.g., "2023-01-01T00:00:00Z")
#     timezone   = string  # Timezone for the schedule (e.g., "UTC", "India Standard Time")
#   })
#   description = "Configuration for the Automation Account schedule"
# }