# main.tf
resource "azurerm_logic_app_action_custom" "http_action" {
  name         = var.name
  logic_app_id = var.logic_app_id
  
  body = jsonencode({
    "type": "Http",
    "inputs": {
      "method": var.method,
      "uri": var.uri,
      "headers": {
        "Content-Type": "application/json"
      },
      "body": var.body,
      "authentication": {
        "type": "ManagedServiceIdentity",
        "audience": var.audience,
      }
    },
    "runAfter": length(var.run_after_config) > 0 ? {
      for item in var.run_after_config :
      item.action_name => [item.action_result]
    } : {}
  })
}