# Databricks notebook source

import json
args = dbutils.widgets.getAll()
msg = args.get("msg", "")
print(msg)

# COMMAND ----------
spark.sql("select current_timestamp() - interval 5 hours as colombia_current_time").display()

context = dbutils.notebook.entry_point.getDbutils().notebook().getContext()
job_id = context.jobId().get()
run_id = context.jobRunId().get()
job_name = context.jobName().get()
context_json = json.loads(context.safeToJson())['attributes']
current_run_id = context_json['currentRunId']

# COMMAND ----------
spark.sql("select current_timestamp()").display()

# COMMAND ----------
print(f"job_id: {job_id}")
print(f"run_id: {run_id}")
print(f"job_name: {job_name}")
print(f"current_run_id: {current_run_id}")