output "id" {
  description = "The ID of the Logic App workflow"
  value       = azurerm_logic_app_action_custom.delay_action.id  
}
output "action_name" {
  description = "Name of the delay action"
  value       = azurerm_logic_app_action_custom.delay_action.name
}