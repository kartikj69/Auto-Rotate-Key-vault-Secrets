variable "name" {
  description = "Name of the Parse JSON action"
  type        = string
  default     = "Parse_JSON"  
}
variable "logic_app_id" {
  description = "ID of the Logic App workflow"
  type        = string  
}
variable "run_after" {
  description = "Specifies which actions this action should run after"
  type        = map(list(string))
  default     = {
  "Regen_Key" = ["Succeeded"]}
}