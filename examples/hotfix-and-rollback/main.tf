module "test_fargate_service" {
  source                    = "github.com/traveloka/terraform-aws-eci-fargate-service.git//modules/service-with-application-lb?ref=v2.1.4"
  environment               = "${local.environment}"
  lb_allowed_cidr           = "${local.lb_allowed_cidr}"
  lb_internal               = "${local.lb_internal}"
  container_defenition_path = "${local.container_definition_path}"
  memory                    = "${local.memory}"
  cpu                       = "${local.cpu}"
  app_type                  = "${local.app_type}"

  min_capacity = "${local.min_capacity}"
  max_capacity = "${local.max_capacity}"

  zone_id  = "${local.zone_id}"
  cert_arn = "${local.cert_arn}"
  has_db   = "${local.has_db}"
  ecr_name = "${local.ecr_name}"

  service_name            = "${local.service_name}"
  product_domain          = "${local.product_domain}"

  vpc_id            = "${local.vpc_id}"
  subnet_app_ids    = "${local.subnet_app_ids}"
  subnet_public_ids = "${local.subnet_public_ids}"

  tags = {
    ProductDomain = "${local.product_domain}"
    Project       = "${local.project_name}"
    Service       = "${local.service_name}"
    Description   = "${local.description}"
    Environment   = "${local.environment}"
    ManagedBy     = "terraform"
  }
}

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