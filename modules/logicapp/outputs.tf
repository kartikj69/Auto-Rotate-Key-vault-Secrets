output "principal_id" {
  description = "The Principal ID of the Logic App's managed identity"
  value       = azurerm_logic_app_workflow.workflow.identity[0].principal_id
}

output "id" {
  description = "The ID of the Logic App workflow"
  value       = azurerm_logic_app_workflow.workflow.id
}