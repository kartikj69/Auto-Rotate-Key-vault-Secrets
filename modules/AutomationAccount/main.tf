resource "azurerm_automation_account" "automation" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  identity {
    type = "SystemAssigned"
  }
}
resource "azurerm_automation_runbook" "runbook" {
  name                    = var.runbook.name
  location                = var.location
  resource_group_name     = var.resource_group_name
  automation_account_name = azurerm_automation_account.automation.name
  log_verbose             = true
  log_progress            = true
  runbook_type            = var.runbook.type
  content                 = var.content
  depends_on              = [azurerm_automation_account.automation]
}
resource "azurerm_automation_schedule" "schedule" {
  name                    = var.schedule.name
  resource_group_name     = var.resource_group_name
  automation_account_name = azurerm_automation_account.automation.name
  frequency               = var.schedule.frequency
  interval                = var.schedule.interval
  start_time              = var.schedule.start_time # Indian Standard Time converted to UTC
  timezone                = var.schedule.timezone
  depends_on              = [azurerm_automation_runbook.runbook]
}
resource "azurerm_automation_job_schedule" "job_schedule" {
  automation_account_name = azurerm_automation_account.automation.name
  resource_group_name     = var.resource_group_name
  runbook_name            = azurerm_automation_runbook.runbook.name
  schedule_name           = azurerm_automation_schedule.schedule.name
  depends_on              = [azurerm_automation_schedule.schedule]
}