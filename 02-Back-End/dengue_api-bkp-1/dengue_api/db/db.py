import mysql.connector

host = 'tidb.c458433.c72edad0.us-east-1.prod.aws.tidbcloud.com'
database = 'test'
user = 'root'
password = 'P@ssw0rd!'
port = 4000

con = mysql.connector.connect(
    host=host, database=database, user=user, password=password, port=port)


def return_estados():
    result = None
    if con.is_connected():
        db_info = con.get_server_info()
        print('Conectado ao servidor MySQL versão ', db_info)

        cursor = con.cursor()
        cursor.execute('select * from estado limit 10')
        print(cursor.fetchall())
        result = cursor.fetchall()

    if con.is_connected():
        cursor.close()
        con.close()
        print('Conexão Encerrada')

    return result


return_estados()
