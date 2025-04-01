resource "azurerm_logic_app_trigger_recurrence" "recurrence_trigger" {
    name         = var.name
    frequency    = var.frequency
    interval     = var.interval
    logic_app_id = var.logic_app_id
    start_time   = var.start_time
}

