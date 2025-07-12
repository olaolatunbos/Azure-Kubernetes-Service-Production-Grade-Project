variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
