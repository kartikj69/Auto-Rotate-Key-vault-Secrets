output "automation_account_principal_id" {
  description = "The Principal ID of the Automation Account for RBAC assignments."
  value       = azurerm_automation_account.automation.identity[0].principal_id
}