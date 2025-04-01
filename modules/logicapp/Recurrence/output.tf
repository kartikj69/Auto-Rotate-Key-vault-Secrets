output "name" {
  description = "The name of the Logic App workflow"
  value       = azurerm_logic_app_trigger_recurrence.recurrence_trigger.name
  
}
output "id" {
  description = "The ID of the Logic App workflow"
  value       = azurerm_logic_app_trigger_recurrence.recurrence_trigger.id
}