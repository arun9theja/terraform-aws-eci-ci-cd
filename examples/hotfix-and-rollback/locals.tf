locals {
  product_domain = "eci"
  service_name = "ecits1"
  project_name = "test-terraform-modules"
  description = "A testing fargate service to test Terraform hotfix & rollback CD module."

  environment = "development"
  lb_allowed_cidr = []
  lb_internal = true
  container_definition_path = ""
  memory = 512
  cpu = 256
  app_type = "springboot"
  min_capacity = 1
  max_capacity = 1

  zone_id = "Z32OEBZ2VZHSJZ"
  cert_arn = "arn:aws:acm:ap-southeast-1:517530806209:certificate/b6631911-7047-4a73-b7ea-b167700a64c4"
  has_db = false
  ecr_name = "apimock"
  vpc_id = "vpc-eaf6088e"
  subnet_app_ids = ["subnet-9eb519e8", "subnet-8270c2e6", "subnet-0ae5e237cbe1a2c76"]
  subnet_public_ids = ["subnet-9cb519ea", "subnet-8d70c2e9", "subnet-0e15d95fafb8ed538"]
}