terraform {
  required_version = ">= 1.6.0"

  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = ">= 0.90.0"
    }
  }

    backend "s3" {
    bucket         = "viktorija-terraform-snowflake"
    key            = "terraform/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
  }
}

provider "snowflake" {
  organization_name = var.snowflake_organization
  account_name  = var.snowflake_account
  user     = var.snowflake_user
  role     = var.snowflake_role
  warehouse = var.snowflake_warehouse
  private_key = file(var.snowflake_private_key_path)
}
