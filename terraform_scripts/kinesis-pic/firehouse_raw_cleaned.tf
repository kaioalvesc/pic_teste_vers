#Descrição: Codigo criacao de buckets teste TerraForm PicPay 
#Data: 12-04-2021 
#Versão: 1 
#Desenvolvedor: Kaio Alves Chaves

resource "aws_kinesis_firehose_delivery_stream" "cleaned_s3_stream" {
  name        = "terraform-kinesis-firehose-cleaned-s3"
  destination = "extended_s3"
  
  kinesis_source_configuration {
    kinesis_stream_arn = aws_kinesis_stream.kinesis_picpay_testeapi.arn
    role_arn = var.picpay_role_teste_arn
  }
  extended_s3_configuration {
    buffer_size = 64
    role_arn   = var.picpay_role_teste_arn
    bucket_arn = var.picpay_aws_s3_cleaned_arn
  

    processing_configuration {
      enabled = "true"

      processors {
        type = "Lambda"

        parameters {
          parameter_name  = "LambdaArn"
          parameter_value = var.lambda_cleaning_pic_arn
        }
      }
    }
  }
}


resource "aws_kinesis_firehose_delivery_stream" "kinesis_raw_pic" {
  name        = "terraform-kinesis-firehose-s3"
  destination = "s3"

  kinesis_source_configuration {
    kinesis_stream_arn = aws_kinesis_stream.kinesis_picpay_testeapi.arn
    role_arn = var.picpay_role_teste_arn
  }
  s3_configuration {
    role_arn   = var.picpay_role_teste_arn
    bucket_arn = var.picpay_aws_s3_raw_arn
  }

}

variable "picpay_role_teste_arn" {
  description = "role ARN"
}


variable "picpay_aws_s3_raw_arn" {
  description = "s3 bucket raw."
}

variable "picpay_aws_s3_cleaned_arn" {
  description = "s3 bucket cleaned."
}

variable "lambda_cleaning_pic_arn" {
  description = "funcao lambda de transformacao de dados arn"
}
