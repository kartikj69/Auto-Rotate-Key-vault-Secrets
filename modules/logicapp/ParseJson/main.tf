resource "azurerm_logic_app_action_custom" "parse" {
  body = jsonencode({
    inputs = {
      content = "@body('Regen_Key')"
      schema = {
        properties = {
          key1 = {
            type = "string"
          }
          key2 = {
            type = "string"
          }
        }
        required = ["key1", "key2"]
        type     = "object"
      }
    },
    type = "ParseJson",
    "runAfter" = var.run_after
  })
  logic_app_id = var.logic_app_id
  name         = var.name
}