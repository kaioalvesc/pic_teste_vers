#Descrição: Codigo criacao de CloudWatch teste TerraForm PicPay 
#Data: 09-04-2021 
#Versão: 1 
#Desenvolvedor: Kaio Alves Chaves
resource "aws_cloudwatch_event_rule" "cloudwatch_dispara_pic" {
  name = "cloudwatch_dispara_pic"
  schedule_expression = "rate(5 minute)"
}

resource "aws_cloudwatch_event_target" "cloudwatch_dispara" {
  rule = aws_cloudwatch_event_rule.cloudwatch_dispara_pic.name
  arn = var.lambda_function_arn
}

resource "aws_lambda_permission" "permite_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "api_lambda_processor"
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.cloudwatch_dispara_pic.arn
}



variable "lambda_function_arn" {
  description = "funcao lambda de ingestao de dados arn"
}