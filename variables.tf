variable "owner" {}

variable "repository" {}

variable "variables" {
  type     = map(string)
  default  = {}
  nullable = false
}

variable "secrets" {
  type     = map(string)
  default  = {}
  nullable = false
}

variable "workflows" {
  type     = map(string)
  default  = {}
  nullable = false
}

variable "branches" {
  type     = list(string)
  default  = ["main"]
  nullable = false
}

variable "environments" {
  type = map(object({
    variables = optional(map(string), {})
    secrets   = optional(map(string), {})
  }))
  default  = {}
  nullable = false
}