variable "owner" {}

variable "repository" {}

variable "variables" {
  type    = map(string)
  default = {}
}

variable "secrets" {
  type    = map(string)
  default = {}
}

variable "workflows" {
  type    = map(string)
  default = {}
}

variable "branches" {
  type    = list(string)
  default = ["main"]
}

variable "environments" {
  type = map(object({
    variables = optional(map(string))
    secrets   = optional(map(string))
  }))
  default = {}
}