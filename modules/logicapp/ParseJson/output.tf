output "name" {
  description = "The name of the Logic App workflow"
  value       = azurerm_logic_app_action_custom.parse.name  
}
output "id" {
  description = "The ID of the Logic App workflow"
  value       = azurerm_logic_app_action_custom.parse.id
}