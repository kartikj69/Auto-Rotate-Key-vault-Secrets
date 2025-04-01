
data "azurerm_resource_group" "rg" {
  name = "Kartik-RG"
}
# data "local_file" "powashell_script" {
# filename = "C:/Users/KartikJindal/Desktop/code/Terraform/translator/workload/regen.ps1"
# }
module "translator" {
  source              = "../modules/translator"
  name                = var.translator_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}
module "keyvault" {
  source              = "../modules/keyvault"
  name                = var.kv_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tenant_id           = var.tenant_id
  depends_on          = [module.translator]
}
module "translator_secret" {
  source       = "../modules/secret"
  secret_name  = var.secret_name
  secret_value = module.translator.translator_api_key
  key_vault_id = module.keyvault.keyvault_id
  depends_on   = [module.keyvault]
}
# module "automation" {
#   source                  = "../modules/AutomationAccount"
#   automation_account_name = var.automation_account_name
#   location                = data.azurerm_resource_group.rg.location
#   resource_group_name     = data.azurerm_resource_group.rg.name
#   sku_name                = var.sku_name
#   runbook                 = var.runbook
#   content                 = data.local_file.powashell_script.content
#   schedule                = var.schedule
#   depends_on              = [module.translator_secret]
# }
# module "automation_roles" {
#   source = "../modules/permissions"
#   for_each = local.automation_roles

#   principal_id         = module.automation.automation_account_principal_id
#   role_definition_name = each.value.role_definition_name
#   scope                = each.value.scope
#   depends_on           = [module.automation]
# }
module "logicapp" {
  source              = "../modules/logicapp"
  name                = var.logicapp_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  key_vault_name      = var.kv_name
  translator_name     = var.translator_name
  secret_name         = var.secret_name
  subscription_id     = var.subscription_id
  schedule            = var.logicapp_schedule
  depends_on          = [module.translator_secret]
}
module "logicapp_roles" {
  source = "../modules/permissions"
  for_each = local.automation_roles
  principal_id         = module.logicapp.principal_id
  role_definition_name = each.value.role_definition_name
  scope                = each.value.scope
  depends_on           = [module.logicapp]
}