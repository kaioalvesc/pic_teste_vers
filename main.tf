#Descrição: Codigo inicial teste TerraForm PicPay 
#Data: 06-04-2021 
#Versão: 1 
#Desenvolvedor: Kaio Alves Chaves

#Construcao de acesso
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}


#Modulos
module "role-pic" {
  source = "./role-pic"
}

module "s3-bucket-pic" {
  source = "./s3-bucket-pic"

  depends_on = [
    module.role-pic
  ]
}

module "lambda-pic" {
  source                = "./lambda-pic"
  picpay_role_teste_arn = module.role-pic.picpay_role_teste_arn
  depends_on = [
    module.role-pic,
    module.s3-bucket-pic
  ]
}

module "kinesis-pic" {
  source                    = "./kinesis-pic"
  picpay_role_teste_arn     = module.role-pic.picpay_role_teste_arn
  picpay_aws_s3_raw_arn     = module.s3-bucket-pic.picpay_aws_s3_raw_arn
  picpay_aws_s3_cleaned_arn = module.s3-bucket-pic.picpay_aws_s3_cleaned_arn
  lambda_cleaning_pic_arn   = module.lambda-pic.lambda_cleaning_pic_arn
  depends_on = [
    module.role-pic,
    module.lambda-pic,
    module.s3-bucket-pic
  ]
}


module "cloudwatch-pic" {
  source              = "./cloudwatch-pic"
  lambda_function_arn = module.lambda-pic.lambda_function_arn
  depends_on = [
    module.role-pic,
    module.lambda-pic,
    module.s3-bucket-pic,
    module.kinesis-pic
  ]

}


module "glue-pic" {
  source                = "./glue-pic"
  picpay_role_teste_arn = module.role-pic.picpay_role_teste_arn
  picpay_s3_bucket_name = module.s3-bucket-pic.picpay_aws_s3_cleaned_name
  depends_on = [
    module.role-pic,
    module.lambda-pic,
    module.s3-bucket-pic,
    module.kinesis-pic,
    module.cloudwatch-pic
  ]

}
