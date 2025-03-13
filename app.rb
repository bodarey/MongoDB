#transfer data from a postgresql to mongodb

require 'pg'
require 'mongo'

# PostgreSQL connection
conn_params = {
  host: 'localhost',  # Replace with your database host
  dbname: 'postgres', # Replace with your database name
  user: 'postgres',   # Replace with your database username
  password: 'fraer'   # Replace with your database password
}
pg_conn = PG.connect(conn_params)

# MongoDB connection
mongo_client = Mongo::Client.new(['localhost:27017'], database: 'Baza')
mongo_collection = mongo_client[:first]

# Fetch data from PostgreSQL
pg_result = pg_conn.exec("SELECT * FROM employees ")

# Insert data into MongoDB
pg_result.each do |row|
  puts row
 mongo_collection.insert_one(row)
end

puts "Data copied from PostgreSQL to MongoDB successfully!"

# Close connections
pg_conn.close
mongo_client.close