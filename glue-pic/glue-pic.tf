#Descrição: Codigo criacao do Glue teste TerraForm PicPay 
#Data: 13-04-2021 
#Versão: 1 
#Desenvolvedor: Kaio Alves Chaves


#Decaraçao de variaveis
variable "picpay_role_teste_arn" {
  description = "role ARN"
}

variable "picpay_s3_bucket_name" {
  description = "Cleaned bucket nome"  
}

#Decaração de recursos

resource "aws_glue_catalog_database" "data_base_glue" {
  name = "data_base_glue"
}


resource "aws_glue_crawler" "cleaned_crawler" {
  database_name = aws_glue_catalog_database.data_base_glue.name
  name          = "cleaned-crawler-glue"
  role          = var.picpay_role_teste_arn

  configuration = jsonencode(
    {
      Grouping = {
        TableGroupingPolicy = "CombineCompatibleSchemas"
      }
      Version = 1
    }
  )

  s3_target {
    path = "s3://${var.picpay_s3_bucket_name}/"
  }
  
}
