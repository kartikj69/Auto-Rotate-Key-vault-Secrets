resource "azurerm_logic_app_action_custom" "delay_action" {
    name         = var.name
    body = jsonencode({
        inputs = {
            interval = {
                count = var.delay_count
                unit  = var.delay_unit
            }
        },
        type     = "Wait",
        "runAfter": length(var.run_after_config) > 0 ? {
      for item in var.run_after_config :
      item.action_name => [item.action_result]
    } : {}
        
    })
    logic_app_id = var.logic_app_id
}
