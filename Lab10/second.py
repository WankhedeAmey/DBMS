import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="csf212",
  passwd="csf212",
  database="db212lab10"
)

mycursor = mydb.cursor()


sql = "INSERT INTO PLAYERS (PLAYER_ID, PLAYER_NAME, TEAM, ROLE) VALUES (%s, %s, %s, %s)" # Insert command to execute. The %s are placeholders which will be 
# replaced by the values in the variable below
val = (202090, "Chris Lynn", "MI", "BOWLER") # val is a variable that can contain constants of different data types.
mycursor.execute(sql, val) #This line executes the insert query. Each of the %s in sql string is replaced by the entries in the val variable.

mydb.commit()

print(mycursor.rowcount, "record inserted.")
