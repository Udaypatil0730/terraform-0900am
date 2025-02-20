# IAM Role for Lambda Execution
# resource "aws_iam_role" "lambda_role" {
#   name = "lambda_execution_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Action = "sts:AssumeRole"
#       Effect = "Allow"
#       Principal = {
#         Service = "lambda.amazonaws.com"
#       }
#     }]
#   })
# }

# Attach AWS-Managed Policy for Basic Execution
# resource "aws_iam_role_policy_attachment" "lambda_policy" {
#   role       = aws_iam_role.lambda_role.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
# }

# Lambda Function
resource "aws_lambda_function" "my_lambda" {
  function_name = "lambda_function"
  role          = "arn:aws:iam::992382809157:role/Lambda-admin"
  handler       = "lambda_remote_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = 120
  memory_size   = 128

  filename         = "lambda_remote_function.zip"  # Ensure this file exists
  source_code_hash = filebase64sha256("lambda_remote_function.zip")
}