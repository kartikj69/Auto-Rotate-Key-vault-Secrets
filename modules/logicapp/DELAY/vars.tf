variable "name" {
    description = "The name of the delay action"
    type        = string
    default = "Delay"
}

variable "delay_count" {
    description = "The count for the delay interval"
    type        = number
    default     = 1
}

variable "delay_unit" {
    description = "The unit for the delay interval (e.g., 'Second', 'Minute', 'Hour')"
    type        = string
    default     = "Minute"
}

variable "logic_app_id" {
    description = "The ID of the logic app"
    type        = string
}
variable "run_after_config" {
  description = "Configuration for run_after dependencies"
  type = list(object({
    action_name   = string
    action_result = string
  }))
  default = []
}