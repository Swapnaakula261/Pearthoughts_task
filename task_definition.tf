resource "aws_ecs_task_definition" "medusa_task" {
  family                   = "medusa-task"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn  # Add this line
  container_definitions    = jsonencode([
    {
      name         = "medusa-backend"
      image        = "977099004021.dkr.ecr.ap-south-1.amazonaws.com/medusa-backend:latest"
      cpu          = 256
      memory       = 512
      essential    = true
      portMappings = [
        {
          containerPort = 9000
          hostPort      = 9000
          protocol      = "tcp"
        },
      ]
    },
  ])
}



