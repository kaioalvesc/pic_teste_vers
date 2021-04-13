#Descrição: Comuniacação com a API, baixando informações 
#Data: 07-04-2021 
#Versão: 1 
#Desenvolvedor: Kaio Alves Chaves

import json
from botocore.vendored import requests
import boto3
import logging

# Parte de baixo é necessária para conseguir usar loggin function 
logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    requisitado = 'https://api.punkapi.com/v2/beers/random'
    requisitado_info = requests.get(requisitado)
    requisitado_json = requisitado_info.json()
    requisitado_json_fora = requisitado_json[0]
    requisitado_json_str = json.dumps(requisitado_json_fora)
    
    if (requisitado_info.status_code == 200):
         logging.info("Retorno da API com sucesso!")  
         requisitado_json_b64 = bytes(requisitado_json_str, 'utf-8')
         print(requisitado_json_fora)
    
         client = boto3.client('kinesis')
    
         response = client.put_record(
         StreamName='kinesis_picpay_testeapi',
         Data=requisitado_json_b64,
         PartitionKey=str(requisitado_json[0]['first_brewed']))
    elif (requisitado_info.status_code == 404):
         logging.error("Resultado não encontrado!")
        
    else:
         logger.error(f"Retorno de erro :{requisitado_info.status_code}")  
    
    return { 
        'statusCode': 200,
        'body': response
    }
        
