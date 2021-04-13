#Descrição: Codigo criacao de Lambda teste TerraForm PicPay 
#Data: 09-04-2021 
#Versão: 1 
#Desenvolvedor: Kaio Alves Chaves
resource "aws_lambda_function" "lambda_function" {
  filename      = "${path.module}/lambda_function.zip"
  function_name = "api_lambda_processor"
  role          = var.picpay_role_teste_arn
  handler       = "lambda_function.lambda_handler"
  runtime = "python3.6"
  timeout       = 60
}


resource "aws_lambda_function" "lambda_cleaning_pic" {
  filename         = "${path.module}/lambda_cleaning_pic.zip"
  function_name    = "api_lambda_processor_cleaning"
  role             = var.picpay_role_teste_arn
  handler          = "lambda_cleaning_pic.lambda_handler"
  source_code_hash = filebase64sha256("${path.module}/lambda_cleaning_pic.zip")
  runtime = "python3.6"
  timeout       = 60
}

variable "picpay_role_teste_arn" {
  description = "role ARN"
}



output "lambda_function_arn" {
  value       = aws_lambda_function.lambda_function.arn
  description = "funcao lambda de ingestao de dados arn"
}


output "lambda_cleaning_pic_arn" {
  value       = aws_lambda_function.lambda_cleaning_pic.arn
  description = "funcao lambda de transformacao de dados arn"
}

