#Descrição: Criacao de ETL cleaning data pra extracao de dados para s3 cleaned
#Data: 07-04-2021 
#Versão: 1 
#Desenvolvedor: Kaio Alves Chaves
from base64 import b64encode, b64decode
from io import StringIO
import json
import csv


def lambda_handler(event, context):
 

    cols = ['id','name','abv','ibu','target_fg','target_og','ebc','srm','ph']
    
     
    records = event["records"]
    firstRecordId = records[0]["recordId"]
    
    resultado=[]

    for record in records:
      record["data"]=json.loads(b64decode(record["data"]).decode("UTF-8"))
      record["data"]=filtra_campos(record["data"], cols)
      record["data"]=dic_para_csv(record["data"], record["recordId"], firstRecordId)
      record["data"]=b64encode(record["data"].encode("UTF-8")).decode("UTF-8")
      record=dict(data = record["data"], result = "Ok", recordId = record["recordId"])
      resultado.append(record)

    return {
        "records": resultado
    }

def dic_para_csv(data, recordId, firstRecordId):

    f = StringIO()
    w = csv.writer(f)
    if recordId == firstRecordId:
        w.writerow(data.keys())
    w.writerow(data.values())
    f.seek(0)
    return f.read()

def filtra_campos(json, colunas):
    json_ret={}
    for coluna in colunas:
      json_ret[coluna]=json.get(coluna)
    
    return json_ret