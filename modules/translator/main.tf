resource "azurerm_cognitive_account" "translator" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "TextTranslation"
  sku_name            = "S1"

  identity {
    type = "SystemAssigned"
  }
}

