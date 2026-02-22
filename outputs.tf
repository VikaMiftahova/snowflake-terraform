output "database" {
  value = snowflake_database.db.name
}

output "schema" {
  value = "${snowflake_schema.schema.database}.${snowflake_schema.schema.name}"
}