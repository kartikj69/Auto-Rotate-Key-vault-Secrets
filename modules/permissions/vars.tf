variable "principal_id" {
  description = "The object ID of the principal (Translator service) to assign the role to."
  type        = string
}
variable "role_definition_name" {
  description = "The name of the role definition to assign to the principal."
  type        = string  
}
variable "scope" {
  description = "The ID of the Key Vault where the role will be assigned."
  type        = string
}