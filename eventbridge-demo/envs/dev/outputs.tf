output "aws_account_id" {
  description = "AWS account used by this workspace."
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  description = "AWS region in use."
  value       = var.aws_region
}
