#Descrição: Codigo criacao de buckets teste TerraForm PicPay 
#Data: 07-04-2021 
#Versão: 1 
#Desenvolvedor: Kaio Alves Chaves

resource "aws_kinesis_stream" "kinesis_picpay_testeapi" {
  name = "kinesis_picpay_testeapi"
  shard_count = 1
  #Unidade de medida 1 = 1000registros por segundo
  retention_period = 24
  #Periodo de retencao em horas

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]

  tags = {
    Environment = "picteste"
  }
}