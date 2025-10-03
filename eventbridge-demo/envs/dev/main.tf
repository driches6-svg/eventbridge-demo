terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # When you're ready to use a remote backend, uncomment and fill these:
  # backend "s3" {
  #   bucket         = "your-tf-state-bucket"
  #   key            = "eventbridge-demo/dev/terraform.tfstate"
  #   region         = "eu-west-2"
  #   dynamodb_table = "your-tf-locks"
  #   encrypt        = true
  # }
}

provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

# --- Placeholders for modules (add as you implement them) ---
# module "dynamodb" {
#   source            = "../../modules/dynamodb"
#   table_name        = "eventbridge_demo_idempotency"
#   billing_mode      = "PAY_PER_REQUEST"
#   point_in_time     = true
# }

# module "sqs_dlq" {
#   source = "../../modules/sqs"
#   name   = "eventbridge-demo-dlq"
# }

# module "lambda_ingest" {
#   source              = "../../modules/lambda"
#   function_name       = "eventbridge-demo-ingest"
#   handler             = "handler.lambda_handler"
#   runtime             = "python3.11"
#   source_path         = "../../lambda"
#   environment = {
#     IDEMPOTENCY_TABLE = "eventbridge_demo_idempotency"
#   }
#   dlq_arn             = module.sqs_dlq.arn
#   enable_xray         = true
# }

# module "eventbridge" {
#   source        = "../../modules/eventbridge"
#   bus_name      = "eventbridge-demo-bus"
#   rule_name     = "eventbridge-demo-rule"
#   event_pattern = jsonencode({ "source" = ["demo.app"] })
#   targets = [{
#     arn  = module.lambda_ingest.arn
#     id   = "lambdaTarget"
#   }]
# }

# module "alarms" {
#   source            = "../../modules/alarms"
#   lambda_function_name = module.lambda_ingest.name
# }
