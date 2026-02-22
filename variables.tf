variable "snowflake_account" {
  type        = string
}

variable "snowflake_organization" {
  type        = string
}

variable "snowflake_user" {
  type        = string
}

variable "snowflake_role" {
  type        = string
}

variable "snowflake_warehouse" {
  type        = string
  default     = "COMPUTE_WH"
}

variable "snowflake_private_key" {
  type        = string
  description = "RSA private key (PEM) for key-pair auth"
  sensitive   = true
}

variable "database_name" {
  type        = string
  default     = "DEMO_DB"
}

variable "schema_name" {
  type        = string
  default     = "PUBLIC"
}