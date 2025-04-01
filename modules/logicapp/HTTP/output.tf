output "http_action_id" {
  description = "ID of the created HTTP action"
  value       = azurerm_logic_app_action_custom.http_action.id
}

output "action_name" {
  description = "Name of the HTTP action"
  value       = azurerm_logic_app_action_custom.http_action.name
}