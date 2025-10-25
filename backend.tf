terraform {
  cloud {

    organization = "sdariza"

    workspaces {
      name = "databricks-iac-workspace"
    }
  }
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~>1.40.0"
    }
  }
}