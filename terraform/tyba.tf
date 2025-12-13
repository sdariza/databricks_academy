
resource "databricks_pipeline" "this" {
  name    = "Pipeline Name"
  serverless = true
  catalog = "tyba"
  target = "default"
  configuration = {
    key1 = "value1"
    key2 = "value2"
  }
  library {
    file {
      path = "/notebooks/tyba/main.py"
    }
  }
  continuous = false
}
