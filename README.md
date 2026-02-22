# Prerequisites

Before using this repo, make sure you have:

 - Snowflake account access (admin role required initially)

 - AWS account (for S3)

 - GitHub repository with Actions enabled

# Preparation Steps:
### Create Snowflake Terraform Service Account

Open a Snowflake Worksheet and run:
```
USE ROLE SECURITYADMIN;

CREATE ROLE TERRAFORM_ROLE;

CREATE USER TERRAFORM_SVC
  LOGIN_NAME = TERRAFORM_SVC
  DEFAULT_ROLE = TERRAFORM_ROLE
  MUST_CHANGE_PASSWORD = FALSE;

GRANT ROLE TERRAFORM_ROLE TO USER TERRAFORM_SVC;
```
Grant warehouse access (example):
```
USE ROLE SYSADMIN;
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE TERRAFORM_ROLE;
```

### Generate Snowflake Key-Pair Authentication

Generate keys locally:
```
openssl genrsa 2048 > snowflake_tf_key.pem
openssl rsa -in snowflake_tf_key.pem -pubout > snowflake_tf_key.pub
```
Attach the public key to the Snowflake user:
```
ALTER USER TERRAFORM_SVC SET RSA_PUBLIC_KEY='<PUBLIC_KEY>';
```
Store snowflake_tf_key.pem in GitHub Secrets as:
```
SNOWFLAKE_PRIVATE_KEY
```
