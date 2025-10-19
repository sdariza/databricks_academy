resource "databricks_job" "notebook_job" {
  name = "Example Notebook Job"
  schedule {
    quartz_cron_expression = "0 0 2 * * ?"
    timezone_id            = "America/Bogota"
    pause_status           = "UNPAUSED"
  }
  max_concurrent_runs = 1
  tags = {
    env = "testing"
  }
}
