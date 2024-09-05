resource "aws_lb" "medusa_lb" {
  name               = "medusa-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.medusa_sg.id]
  subnets            = [aws_subnet.medusa_subnet.id, aws_subnet.additional_subnet.id]  # Reference both subnets

  enable_deletion_protection = false
  enable_http2               = true
  idle_timeout               = 60

  access_logs {
    bucket  = aws_s3_bucket.medusa_logs.bucket
    enabled = true
    prefix  = "log"
  }

  tags = {
    Name = "medusa-lb"
  }
}

