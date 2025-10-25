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
      notebook_path = "/Workspace/Users/sdariza.certifications@gmail.com/TEST/hello_world"
      base_parameters = {
        msg = "Hello world, this is my first lakeflow job with terraform!"
      }
    }
  }
  task {
    task_key = "custom_message"
    notebook_task {
      notebook_path = "/Workspace/Users/sdariza.certifications@gmail.com/TEST/hello_world"
      base_parameters = {
        msg = "Validating PR"
      }
    }
    depends_on {
      task_key = "hello_world_testing"
    }
  }
  max_concurrent_runs = 1
  tags = {
    env = "testing"
  }
}
