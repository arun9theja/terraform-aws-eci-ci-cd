resource "aws_codebuild_project" "this" {
  name = "${var.service_name}-hotfix-or-rollback-to-fargate"
  description = "Build project to deploy a specific image to Fargate, usually being used in hotfix and rollback scenario."
  service_role = "${var.service_role_arn}"
  build_timeout = "10"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  "environment" {
    compute_type = "BUILD_GENERAL1_SMALL"
    image = ""
    type = "LINUX_CONTAINER"

    environment_variable {
      name = "IMAGE_TAG"
      value = ""
    }
  }

  source {
    type = "NO_SOURCE"
  }

  tags {
    ProductDomain = "${var.product_domain}"
    Environment = "${var.environment}"
    ServiceName = "${var.service_name}"
  }
}
