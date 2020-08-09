import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="csf212",
  passwd="csf212",
  database="db212lab10"
)

mycursor = mydb.cursor()


sql = "UPDATE PLAYERS SET NATIONALITY = %s WHERE PLAYER_ID = %s" #This update query has %s in two places. This will be replaced by
#  the strings in the val variable
val = ("Australia", "202090")

mycursor.execute(sql, val) #Forms a query by replacing %s in sql by the values in val.

mydb.commit()

print(mycursor.rowcount, "record(s) affected") #Check whether the change has been reflected in the database.