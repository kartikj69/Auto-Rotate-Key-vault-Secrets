variable "name" {
  description = "Name of the Logic App workflow"
  type        = string
}

variable "location" {
  description = "Azure region where Logic App will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "key_vault_name" {
  description = "Name of the Key Vault"
  type        = string
}

variable "translator_name" {
  description = "Name of the Translator service"
  type        = string
}

variable "secret_name" {
  description = "Name of the secret in Key Vault"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "schedule" {
  type = object({
    interval   = number
    frequency  = string
    timezone   = string
    start_time = string
  })
  description = "Schedule configuration for the Logic App"
}

variable "recurrence_name" {
  description = "Name for the hourly recurrence module"
  default     = "Hourly_Recurrence"
  type        = string
}

variable "regenerate_key_name" {
  description = "Name for the key regeneration module"
  default     = "Regen_Key"
  type        = string
}

variable "parse_name" {
  description = "Name for the key storage module"
  default     = "Store_Key"
  type        = string
}

variable "delete_secret_name" {
  description = "Name for the secret deletion module"
  default     = "Delete_Secret"
  type        = string
}

variable "delay_name" {
  description = "Name for the delay module"
  default     = "Delay_Action"
  type        = string
}

variable "delete_deleted_secret_name" {
  description = "Name for the delete deleted secret module"
  default     = "Delete_Deleted_Secret"
  type        = string
}

variable "delete_delay_name" {
  description = "Name for the delete delay module"
  default     = "Delete_Delay_Action"
  type        = string
}

variable "add_key_name" {
  description = "Name for the add key module"
  default     = "Add_Key"
  type        = string
}
variable "audience" {
  description = "Audience for the HTTP action"
  type        = string
  default     = "https://vault.azure.net"
}