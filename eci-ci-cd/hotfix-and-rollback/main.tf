module "codebuild_iam_role" {
  source = "github.com/traveloka/terraform-aws-iam-role.git//modules/service?ref=v1.0.1"

  environment    = "${var.environment}"
  product_domain = "${var.product_domain}"

  role_identifier            = "${var.service_name}-eci-ci-cd-hotfix-and-rollback"
  role_description           = "Service Role for ${var.service_name}-hotfix-or-rollback-to-fargate CodeBuild project."
  role_force_detach_policies = true
  role_max_session_duration  = 43200

  aws_service = "codebuild.amazonaws.com"
}

# Attach inline policy to CodeBuild
resource "aws_iam_role_policy" "codebuild" {
  policy = "${data.aws_iam_policy_document.codebuild.json}"
  role = "${module.codebuild_iam_role.role_name}"
}
