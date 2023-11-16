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

variable "azure_oidc" {
  type = object({
    scopes = map(object({
      scope                = string
      role_definition_name = string
    }))
    audiences     = optional(set(string), ["api://AzureADTokenExchange"])
    issuer        = optional(string, "https://token.actions.githubusercontent.com")
    pull_requests = optional(bool, true)
  })
  default = null
}
