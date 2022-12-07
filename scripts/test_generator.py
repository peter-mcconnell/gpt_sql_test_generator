# Import necessary modules
import psycopg2

# Connect to the PostgreSQL service
conn = psycopg2.connect(
  host="postgres",
  database="postgres",
  user="postgres",
  password="postgres"
)

# Create a cursor object
cur = conn.cursor()

# Execute a query to get all of the tables in the database
cur.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'")

# Get the list of tables
tables = cur.fetchall()

# Print the list of tables
print("Tables in the database:")
for table in tables:
    print(table[0])

# Iterate over each table in the database
for table in tables:
    # Get the list of columns in the table
    cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = '{}'".format(table[0]))
    columns = cur.fetchall()

    # Generate a test for selecting all of the columns in the table
    print("Testing SELECT * FROM {}:".format(table[0]))
    print("EXPECTED RESULT: All columns and rows in the table")
    print("ACTUAL RESULT:")
    cur.execute("SELECT * FROM {}".format(table[0]))
    rows = cur.fetchall()
    for row in rows:
        print(row)
    print()

    # Generate a test for selecting each individual column in the table
    for column in columns:
        print("Testing SELECT {} FROM {}:".format(column[0], table[0]))
        print("EXPECTED RESULT: All values in the {} column".format(column[0]))
        print("ACTUAL RESULT:")
        cur.execute("SELECT {} FROM {}".format(column[0], table[0]))
        rows = cur.fetchall()
        for row in rows:
            print(row)
        print()

# Iterate over each table in the database
for table in tables:
    # Get the list of columns in the table
    cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = '{}'".format(table[0]))
    columns = cur.fetchall()

    # Generate a test for updating each individual column in the table
    for column in columns:
        print("Testing UPDATE {} SET {} = <new_value> WHERE <condition>:".format(table[0], column[0]))
        print("EXPECTED RESULT: The value in the {} column is updated where the condition is met".format(column[0]))
        print("ACTUAL RESULT:")
        # Use a placeholder for the new value and condition in the update statement
        cur.execute("UPDATE {} SET {} = %s WHERE %s".format(table[0], column[0]), ("new_value", "condition"))
        # Print the number of rows that were updated
        print("Number of rows updated:", cur.rowcount)
        print()

# Iterate over each table in the database
for table in tables:
    # Generate a test for deleting rows from the table
    print("Testing DELETE FROM {} WHERE <condition>:".format(table[0]))
    print("EXPECTED RESULT: Rows are deleted from the table where the condition is met")
    print("ACTUAL RESULT:")
    # Use a placeholder for the condition in the delete statement
    cur.execute("DELETE FROM {} WHERE %s".format(table[0]), ("condition",))
    # Print the number of rows that were deleted
    print("Number of rows deleted:", cur.rowcount)
    print()

# Iterate over each table in the database
for table in tables:
    # Get the list of columns in the table
    cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = '{}'".format(table[0]))
    columns = cur.fetchall()

    # Generate a test for inserting a row into the table
    print("Testing INSERT INTO {} ({}) VALUES ({}):".format(table[0], ", ".join([column[0] for column in columns]), ", ".join(["%s"] * len(columns))))
    print("EXPECTED RESULT: A new row is inserted into the table with the specified values")
    print("ACTUAL RESULT:")
    # Use placeholders for the values in the insert statement
    cur.execute("INSERT INTO {} ({}) VALUES ({})".format(table[0], ", ".join([column[0] for column in columns]), ", ".join(["%s"] * len(columns))), ("value1", "value2", "value3"))
    # Print the number of rows that were inserted
    print("Number of rows inserted:", cur.rowcount)
    print()
