import mysql.connector
import json

config = {
    'host': 'tidb.c458433.c72edad0.us-east-1.prod.aws.tidbcloud.com',
    'database': 'test',
    'user': 'root',
    'password': 'P@ssw0rd!',
    'port': 4000
}

con = mysql.connector.connect(**config)


def return_estados():
    result = None
    if con.is_connected():
        db_info = con.get_server_info()
        print('Conectado ao servidor MySQL versão ', db_info)
        cursor = con.cursor(dictionary=True)
        cursor.execute('select * from estado limit 10')
        result = cursor.fetchall()
        print(result)

    if con.is_connected():
        cursor.close()
        con.close()
        print('Conexão Encerrada')

    return result


return_estados()
