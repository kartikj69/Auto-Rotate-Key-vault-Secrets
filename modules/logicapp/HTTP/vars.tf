variable "key_name" {
  description = "Key name to be used in the HTTP request body"
  type        = string
  default     = "Key1"
}

variable "logic_app_id" {
  description = "ID of the Logic App"
  type        = string
}

variable "method" {
  description = "HTTP method for the request"
  type        = string
  default     = "POST"
}

variable "name" {
  description = "Name of the HTTP action"
  type        = string
  default     = "Regen_Key"
}

variable "uri" {
  description = "URI endpoint for the HTTP request"
  type        = string
}
variable "body" {
  description = "Body of the HTTP request"
  type        = any
  }
variable "run_after_config" {
  description = "Configuration for run_after dependencies"
  type = list(object({
    action_name   = string
    action_result = string
  }))
  default = []
}
variable "audience" {
  description = "Audience for the HTTP request"
  type        = string
}