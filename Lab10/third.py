import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="csf212",
  passwd="csf212",
  database="db212lab10"
)

mycursor = mydb.cursor()


## The below five lines shows query string construction using concatenation. This should be avoided because the application becomes prone
## to sql-injection attack. Read about sql-injection attack (see exercise questions).
#sql = "SELECT PLAYER_ID, PLAYER_NAME FROM PLAYERS"
#val = " WHERE TEAM='MI';"
#concatSql = sql + val
#mycursor.execute(concatSql)
## The above four lines show one way of constructing a query string.

# The lines below should how an insert query with a where clause must be constructed. This way of construction can avoid the 
# sql-injection attack.

sql = "SELECT PLAYER_ID, PLAYER_NAME FROM PLAYERS WHERE TEAM = %s"
val = ("MI", )
mycursor.execute(sql, val)   #This is how we pass values to the execute function. The execute function replaces %s with the values in the tuple variable val.

for x in mycursor:  #This is a for loop that executes once for each row in the above query
  pid,pname = x  #A tuple can be assigned to two variable. Each variable will be assigned successive entries in the tuple. 
#  print(x)  # Uncomment this line and see how the output changes.
  print(pid,pname)  #Prints the contents of each row in the above query