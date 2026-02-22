resource "snowflake_database" "db" {
  name    = "bootcamp-db"
  comment = "Bootcamp Task"
}

resource "snowflake_schema" "schema" {
  database = snowflake_database.db.name
  name     = "bootcamp-schema"
  comment  = "Bootcamp Task"
}