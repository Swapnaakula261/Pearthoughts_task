# resource "aws_ecs_service" "medusa_service" {
#   name            = "medusa-service"
#   cluster         = aws_ecs_cluster.medusa_cluster.id
#   task_definition = aws_ecs_task_definition.medusa_task.arn
#   launch_type     = "FARGATE"
#   desired_count   = 1
#
#   network_configuration {
#     subnets          = [aws_subnet.medusa_subnet.id]
#     security_groups  = [aws_security_group.medusa_sg.id]
#     assign_public_ip = true
#   }
#
#   load_balancer {
#     target_group_arn = aws_lb_target_group.medusa_target_group.arn
#     container_name   = "medusa-backend"
#     container_port   = 9000
#   }
#
#   depends_on = [aws_lb_listener.http_listener]
# }



