resource "databricks_repo" "git_repo" {
  url    = "https://github.com/sdariza/databricks_academy.git"
  branch = "test"
}

resource "databricks_git_credential" "git_credential" {
  git_username          = "sdariza"
  git_provider          = "gitHub"
  personal_access_token = var.git_personal_access_token
}

resource "databricks_job" "notebook_job" {
  name = "My first notebook job with terraform"
  schedule {
    quartz_cron_expression = "0 0 2 * * ?"
    timezone_id            = "America/Bogota"
    pause_status           = "UNPAUSED"
  }
  task {
    task_key = "hello_world"
    notebook_task {
      notebook_path = "notebooks/hello"
      source        = "GIT"
      base_parameters = {
        msg = "Hello world, this is my first lakeflow job with terraform!"
      }
    }

  }
  task {
    task_key = "custom_message"
    notebook_task {
      source        = "GIT"
      notebook_path = "notebooks/hello"
      base_parameters = {
        msg = "Validating PR"
      }
    }
    depends_on {
      task_key = "hello_world"
    }
  }
  max_concurrent_runs = 1
  tags = {
    env = "testing"
  }
  git_source {
    url = databricks_repo.git_repo.url
    branch = "test"
    provider = "gitHub"
  }
}
