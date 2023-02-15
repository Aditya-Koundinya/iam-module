

variable "create_user" {
  description = "Whether to create the IAM user"
  type        = bool
  default     = true
}

variable "create_policy" {
  description = "Whether to create the IAM policy"
  type        = bool
  default     = true
}

variable "create_iam_access_key" {
  description = "Whether to create IAM access key"
  type        = bool
  default     = true
}

variable "name" {
  description = "Desired name for the IAM user"
  type        = string
}

variable "policy_name" {
  description = "Desired name for the IAM policy"
  type        = string
  default     = ""
}

variable "policy_description" {
  description = "Description for the IAM policy"
  type        = string
  default     = ""
}

variable "path" {
  description = "Desired path for the IAM user"
  type        = string
  default     = "/"
}

variable "policy_path" {
  description = "The path of the policy in IAM"
  type        = string
  default     = "/"
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  type        = bool
  default     = false
}

variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key."
  type        = string
  default     = ""
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the user."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "policy" {
  description = "The path of the policy in IAM (tpl file)"
  type        = string
  default     = ""
}

variable "iam_access_key_status" {
  description = "Access key status to apply."
  type        = string
  default     = null
}

variable "readonly_role_policy_arn" {
  description = "Policy ARN to use for readonly role"
  type        = string
  default     = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

variable "attach_readonly_policy" {
  description = "Whether to attach a readonly policy to a role"
  type        = bool
  default     = false
}