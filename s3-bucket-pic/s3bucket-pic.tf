#Descrição: Codigo criacao de buckets teste TerraForm PicPay 
#Data: 07-04-2021 
#Versão: 1 
#Desenvolvedor: Kaio Alves Chaves
resource "aws_s3_bucket" "raw" {
  bucket        = "picpay-bucket-kaio-raw"
  acl           = "private"
  force_destroy = true

  tags = {
    Name        = "raw"
    Environment = "picteste"
  }
}

resource "aws_s3_bucket" "cleaned" {
  bucket        = "picpay-bucket-kaio-cleaned"
  acl           = "private"
  force_destroy = true

  tags = {
    Name        = "cleaned"
    Environment = "picteste"
  }
}

output "picpay_aws_s3_raw_arn" {
  value       = aws_s3_bucket.raw.arn
  description = "s3 bucket cleaned."
}

output "picpay_aws_s3_cleaned_arn" {
  value       = aws_s3_bucket.cleaned.arn
  description = "s3 bucket raw."
}

output "picpay_aws_s3_cleaned_name" {
  value       = aws_s3_bucket.cleaned.bucket
  description = "s3 bucket cleaned name."
}

