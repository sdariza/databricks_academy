variable "databricks_host" {
  description = "Databricks workspace URL"
  type        = string
  sensitive   = true
}

variable "databricks_token" {
  description = "Databricks personal access token"
  type        = string
  sensitive   = true
}

variable "git_username" {
  description = "git username"
  type        = string
  sensitive   = true
}

variable "git_personal_access_token" {
  description = "token for github"
  type        = string
  sensitive   = true
}

variable "git_hub_url" {
  description = "repo url"
  type = string
}