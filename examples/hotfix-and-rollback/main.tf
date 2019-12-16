module "hotfix-and-rollback" {
  source = "../../modules/hotfix-and-rollback"

  service_name = "${local.service_name}"
  service_role_arn = "${module.hotfix-and-rollback-iam-role.role_arn}"
  fargate_service_name = need_fill_in
  ecr_repo_name = need_fill_in
}

module "hotfix-and-rollback-iam-role" {
  source = "github.com/traveloka/terraform-aws-eci-common-iam-roles.git//modules/eci-ci-cd/hotfix-and-rollback?ref=CTD-190"

  environment = "development"
  service_name = "${local.service_name}"
}