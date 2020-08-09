import mysql.connector  #This is like including a header file in a C program. The import command includes the library mysql.connector.

mydb = mysql.connector.connect(
  host="localhost",
  user="csf212",   #change the username and password according to your mysql server
  passwd="csf212",
  database="db212lab10"
) #This is a function that is written over multiple lines. We often do this while writing a python program.
# The above function gives a connection object (Object is a variable whose data type is a class).
# Check object oriented programming on wikipedia.

mycursor = mydb.cursor()  #The connection object can create a cursor object, which we can use to execute commands. 

mycursor.execute("SELECT PLAYER_NAME FROM PLAYERS;")  #This is how we can use the cursor object to excecute a command. Here execute is a function that takes a string argument.

for x in mycursor:  #This is a for loop that executes once for each row in the above query
  print(x)  #Prints the contents of each row in the above query