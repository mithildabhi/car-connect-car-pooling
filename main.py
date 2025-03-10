import psycopg2
from psycopg2 import Error

def connect_to_database():
    try:
        # Establish connection
        connection = psycopg2.connect(
            database="postgres",
            user="postgres.zdrnyoshpjpqazrdfarg",
            password="mithil123nnnyu",
            host="aws-0-us-west-1.pooler.supabase.com",
            port="6543"
        )

        # Create a cursor
        cursor = connection.cursor()
        
        # Print PostgreSQL details
        print("Successfully connected to PostgreSQL database!")
        print("PostgreSQL server information:", connection.get_dsn_parameters())

        # Close cursor and connection
        cursor.close()
        connection.close()
        print("Database connection closed.")

    except (Exception, Error) as error:
        print("Error while connecting to PostgreSQL:", error)

if __name__ == "__main__":
    connect_to_database()