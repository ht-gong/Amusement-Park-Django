import sqlite3

connection = sqlite3.connect("db.sqlite3")

cursor = connection.cursor()

sql_file = open("SQL_scripts/Drop_Creation_Insertion.sql")
sql_as_string = sql_file.read()
cursor.executescript(sql_as_string)

connection.commit()
connection.close()