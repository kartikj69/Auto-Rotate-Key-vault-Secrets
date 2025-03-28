locals {
  automation_roles = {
    KVSO = {
      role_definition_name = "Key Vault Administrator"
      scope                = module.keyvault.keyvault_id
    }
    CSC = {
      role_definition_name = "Cognitive Services Contributor"
      scope                = module.translator.translator_id
    }
  }
}