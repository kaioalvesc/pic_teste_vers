#Descrição: Codigo criacao de Lambda teste TerraForm PicPay 
#Data: 09-04-2021 
#Versão: 1 
#Desenvolvedor: Kaio Alves Chaves

#Decaraçao de variaveis
variable "picpay_role_teste_arn" {
  description = "role ARN"
}



resource "aws_lambda_function" "lambda_function" {
  filename      = "${path.module}/lambda_function.zip"
  function_name = "api_lambda_processor"
  role          = var.picpay_role_teste_arn
  handler       = "lambda_function.lambda_handler"
  runtime = "python3.6"
  timeout       = 60

    tags = {
    Environment = "picteste"
  }
}


resource "aws_lambda_function" "lambda_cleaning_pic" {
  filename         = "${path.module}/lambda_cleaning_pic.zip"
  function_name    = "api_lambda_processor_cleaning"
  role             = var.picpay_role_teste_arn
  handler          = "lambda_cleaning_pic.lambda_handler"
  runtime = "python3.6"
  timeout       = 60

    tags = {
    Environment = "picteste"
  }
}


#Decaraçao de output

output "lambda_function_arn" {
  value       = aws_lambda_function.lambda_function.arn
  description = "funcao lambda de ingestao de dados arn"
}


output "lambda_cleaning_pic_arn" {
  value       = aws_lambda_function.lambda_cleaning_pic.arn
  description = "funcao lambda de transformacao de dados arn"
}

