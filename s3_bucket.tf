resource "aws_s3_bucket" "medusa_logs" {
  bucket = "medusa-access-logs-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = "medusa-logs"
  }
}

resource "aws_s3_bucket_policy" "medusa_logs_policy" {
  bucket = aws_s3_bucket.medusa_logs.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        Resource = "${aws_s3_bucket.medusa_logs.arn}/*"
      }
    ]
  })
}
