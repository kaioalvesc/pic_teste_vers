resource "aws_glue_catalog_database" "data_base_glue" {
  name = "data_base_glue"
}

resource "aws_glue_catalog_database" "metastore" {
  name = "hive-metastore"
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
    path = "s3://picpay-bucket-kaio-cleaned8/"
  }
}


variable "picpay_role_teste_arn" {
  description = "role ARN"
}

