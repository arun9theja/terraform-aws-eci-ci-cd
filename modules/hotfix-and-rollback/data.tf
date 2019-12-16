data "template_file" "buildspec" {
  template = <<EOF
phases:
  install:
    commands:
      -
  pre_build:
    commands:
      -
  build:
    commands:
      # Create new task definition
      - export $FARGATE_TASK_DEFINITION_ID = $(aws ecs register-task-definition --family $${ fargate_service_name } --container-definitions [{\"name\":\"app\",\"image\":\"$${ ecr_repo_url }:$IMAGE_TAG\"}])
      # Deploy new images
      - aws ecs update-service --service $${ fargate_service_name } --task-definition $FARGATE_TASK_DEFINITION_ID
  post_build:
    commands:
      -
EOF

  vars {
    fargate_service_name = "${var.fargate_service_name}"
    ecr_repo_url = "${data.aws_ecr_repository.current.repository_url}"
  }
}

data "aws_ecr_repository" "current" {
  name = "${var.ecr_repo_name}"
}