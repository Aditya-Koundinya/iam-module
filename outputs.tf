output "iam_user_name" {
  description = "The user's name"
  value       = try(aws_iam_user.this[0].name, "")
}

output "iam_user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = try(aws_iam_user.this[0].arn, "")
}

output "iam_access_key_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the secret"
  value       = try(aws_iam_access_key.this[0].key_fingerprint, "")
}

output "pgp_key" {
  description = "PGP key used to encrypt sensitive data for this user (if empty - secrets are not encrypted)"
  value       = var.pgp_key
}