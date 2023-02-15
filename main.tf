resource "aws_iam_user" "this" {
  count = var.create_user ? 1 : 0

  name                 = var.name
  path                 = var.path
  force_destroy        = var.force_destroy
  permissions_boundary = var.permissions_boundary

  tags = var.tags
}

resource "aws_iam_access_key" "this" {
  count = var.create_user && var.create_iam_access_key && var.pgp_key != "" ? 1 : 0

  user    = aws_iam_user.this[0].name
  pgp_key = var.pgp_key
  status  = var.iam_access_key_status
}

resource "aws_iam_policy" "this" {
  count = var.create_policy ? 1 : 0

  name        = var.policy_name
  path        = var.policy_path
  description = var.policy_description

  policy = var.policy

}

resource "aws_iam_user_policy_attachment" "this" {
  user       = aws_iam_user.this[0].name
  policy_arn = aws_iam_policy.this[0].arn
}

resource "aws_iam_user_policy_attachment" "readonly" {
  count = var.create_policy && var.attach_readonly_policy ? 1 : 0

  user       = aws_iam_user.this[0].name
  policy_arn = var.readonly_role_policy_arn
}