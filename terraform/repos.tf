resource "databricks_repo" "git_repo" {
  url    = "https://github.com/sdariza/databricks_academy.git"
  branch = "main"
}

resource "databricks_git_credential" "git_credential" {
  git_username          = "sdariza"
  git_provider          = "gitHub"
  personal_access_token = var.git_personal_access_token
}