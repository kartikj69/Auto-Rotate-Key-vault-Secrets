variable "location" {
  type        = string
  description = "Azure region where the Automation Account will be deployed"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where the Automation Account will be deployed"
}
variable "automation_account_name" {
  type        = string
  description = "Name of the Azure Automation Account"
}
variable "sku_name" {
  type        = string
  description = "SKU name for the Automation Account (e.g., Basic, Free)"
}
variable "runbook" {
  type = object({
    name = string,
    type = string, # Type of the runbook (e.g., PowerShell, Python)
  })
}
variable "schedule" {
  type = object({
    name       = string, # Name of the schedule
    frequency  = string, # Frequency of the schedule (e.g., OneTime, Hour, Day, Week, Month)
    interval   = number, # Interval for the schedule
    start_time = string, # Start time of the schedule in UTC (e.g., "2023-01-01T00:00:00Z")
    timezone   = string  # Timezone for the schedule (e.g., "UTC", "India Standard Time")
  })
  description = "Configuration for the Automation Account schedule"
}
variable "content" {
  type        = string
  description = "Content of the runbook script"  
}