variable "environment" {
  description = "The name of your environment (development, staging or production)."
}

variable "service_name" {
  description = "The name of your service, which is used to name your Fargate service, for example, ecibpms."
}

variable "product_domain" {
  default = "eci"
  description = "Your product domain, default to be \"eci\"."
}

variable "service_role_arn" {
  description = "Service role for this CodeBuild. Usually is the one created via https://github.com/traveloka/terraform-aws-eci-common-iam-roles/tree/master/modules/eci-ci-cd/hotfix-and-rollback"
}

variable "fargate_service_name" {
  description = "Name of Fargate service this CodeBuild will deploy to (for example, ecidms-app-92c3bb652d1d377f)."
}

variable "ecr_repo_name" {
  description = "Name of ECR repo used for Fargate service (for example: ecibpms-0c803dc4ce4587f9)."
}

variable "ecr_region" {
  description = "Region of the ECR repo. Default to ap-southeast-1"
  default = "ap-southeast-1"
}