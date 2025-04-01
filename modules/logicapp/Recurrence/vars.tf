variable "name" {
    description = "Name of the recurrence trigger"
    type        = string
    default     = "Hourly"
}

variable "frequency" {
    description = "Frequency of the recurrence (Minute, Hour, Day, Week, Month)"
    type        = string
    default     = "Hour"
}

variable "interval" {
    description = "Interval of the recurrence"
    type        = number
    default     = 1
}

variable "logic_app_id" {
    description = "ID of the Logic App workflow"
    type        = string
}

variable "start_time" {
    description = "Start time for the recurrence trigger"
    type        = string
    default     = "2025-03-31T11:30:00Z"
}