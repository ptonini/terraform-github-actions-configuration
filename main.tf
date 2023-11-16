data "github_repository" "this" {
  name = var.repository
}

resource "github_actions_variable" "this" {
  for_each      = var.variables
  repository    = data.github_repository.this.name
  variable_name = each.key
  value         = each.value
}

resource "github_actions_secret" "this" {
  for_each        = var.secrets
  repository      = data.github_repository.this.name
  secret_name     = each.key
  plaintext_value = each.value
}

module "environments" {
  source          = "ptonini/repository-environment/github"
  version         = "~> 1.0.0"
  for_each        = var.environments
  repository_name = data.github_repository.this.name
  name            = each.key
  variables       = each.value.variables
  secrets         = each.value.secrets
}

module "workflows" {
  source     = "ptonini/repository-file/github"
  for_each   = var.workflows
  repository = data.github_repository.this
  file       = ".github/workflows/${each.key}.yml"
  content    = each.value
}

