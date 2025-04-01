resource "azurerm_logic_app_workflow" "workflow" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  identity {
    type = "SystemAssigned"
  }
  workflow_parameters = {
    "$connections" = jsonencode({
      defaultValue = {},
      type         = "Object"
    })
  }
  parameters = {
    "$connections" = "{}"
  }
}
module "Hourly_Recurrence" {
  source       = "./Recurrence"
  name         = var.recurrence_name
  frequency    = "Hour"
  interval     = 1
  logic_app_id = azurerm_logic_app_workflow.workflow.id
  depends_on   = [azurerm_logic_app_workflow.workflow]
}
module "regenerateKey" {
  source       = "./HTTP"
  name         = var.regenerate_key_name
  method       = "POST"
  uri          = local.AI_uri
  logic_app_id = azurerm_logic_app_workflow.workflow.id
  body         = local.body_key
  audience     = null
  depends_on   = [module.Hourly_Recurrence]
}
module "ParseJson" {
  source       = "./ParseJson"
  name         = var.parse_name
  logic_app_id = azurerm_logic_app_workflow.workflow.id
  run_after = {
    "${var.regenerate_key_name}" = ["Succeeded"]
  }
  depends_on = [module.regenerateKey]
}
module "delete_secret" {
  source       = "./HTTP"
  name         = var.delete_secret_name
  method       = "DELETE"
  uri          = local.KV_uri
  logic_app_id = azurerm_logic_app_workflow.workflow.id
  body         = null
  audience     = var.audience
  run_after_config = [
    {
      action_name   = var.parse_name
      action_result = "Succeeded"
    }
  ]
  depends_on = [module.ParseJson]
}
module "delay" {
  source       = "./DELAY"
  name         = var.delay_name
  logic_app_id = azurerm_logic_app_workflow.workflow.id
  run_after_config = [
    {
      action_name   = var.delete_secret_name
      action_result = "Succeeded"
    }
  ]
  depends_on = [module.ParseJson]
}
module "Delete_Deleted_Secret" {
  source       = "./HTTP"
  name         = var.delete_deleted_secret_name
  method       = "DELETE"
  audience     = var.audience
  uri          = local.Del_Uri
  logic_app_id = azurerm_logic_app_workflow.workflow.id
  body         = null
  run_after_config = [
    {
      action_name   = var.delay_name
      action_result = "Succeeded"
    }
  ]
  depends_on = [module.delay]
}
module "delete_delay" {
  source       = "./DELAY"
  name         = var.delete_delay_name
  logic_app_id = azurerm_logic_app_workflow.workflow.id
  run_after_config = [
    {
      action_name   = var.delete_deleted_secret_name
      action_result = "Succeeded"
    }
  ]
  depends_on = [module.Delete_Deleted_Secret]
}
module "add_key" {
  source       = "./HTTP"
  name         = var.add_key_name
  method       = "PUT"
  uri          = local.KV_uri
  body         = local.add_key
  audience     = var.audience
  logic_app_id = azurerm_logic_app_workflow.workflow.id
  run_after_config = [
    {
      action_name   = var.delete_delay_name
      action_result = "Succeeded"
    }
  ]
  depends_on = [module.delete_delay]
}