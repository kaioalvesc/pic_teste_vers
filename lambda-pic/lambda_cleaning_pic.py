#Descrição: Criacao de ETL cleaning data pra extracao de dados para s3 cleaned
#Data: 07-04-2021 
#Versão: 1 
#Desenvolvedor: Kaio Alves Chaves

from base64 import b64encode, b64decode
from io import StringIO
import json
import boto3
import csv

#Descrição: Criacao de ETL cleaning data pra extracao de dados para s3 cleaned
#Data: 07-04-2021 
#Versão: 1 
#Desenvolvedor: Kaio Alves Chaves

from base64 import b64encode, b64decode
from io import StringIO
import json
import boto3
import csv
import logging


logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
 
 
    decode = lambda x: b64decode(x).decode("UTF-8")
    encode = lambda x: b64encode(x.encode("UTF-8")).decode("UTF-8")


    extract_cols = lambda data, cols: {key: data[key] for key in cols}
    cols = ['id','name','abv','ibu','target_fg','target_og','ebc','srm','ph']
    
    try:
     
        records = event["records"]
        firstRecordId = records[0]["recordId"]
        
   
        records = map(lambda x: x.update(data = json.loads(decode(x["data"]))) or x                             , records)
        records = map(lambda x: x.update(data = extract_cols(x["data"], cols)) or x                             , records)
        records = map(lambda x: x.update(data = dict_to_csv(x["data"], x["recordId"], firstRecordId)) or x      , records)
        records = map(lambda x: x.update(data = encode(x["data"])) or x                                         , records)
        records = map(lambda x: dict(data = x["data"], result = "Ok", recordId = x["recordId"]) or x            , records)
        
    except Exception as e:
        logger.error("Ocorreu um erro")
        raise e

    return {
        "records": list(records)
    }

def dict_to_csv(data, recordId, firstRecordId):

    f = StringIO()
    w = csv.writer(f)
    if recordId == firstRecordId:
        w.writerow(data.keys())
    w.writerow(data.values())
    f.seek(0)
    return f.read()