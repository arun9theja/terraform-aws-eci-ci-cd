provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket         = "examples-terraform-state-ap-southeast-1-105676898724"
    dynamodb_table = "examples-terraform-state-ap-southeast-1-105676898724"
    key            = "terraform-aws-eci-ci-cd/examples/hotfix-and-rollback/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt = true
  }
}
