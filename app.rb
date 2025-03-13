#transfer data from a postgresql to mongodb

require 'pg'
require 'mongo'

# PostgreSQL connection
conn_params = {
  host: 'localhost',  
  dbname: 'postgres', 
  user: 'postgres',   
  password: 'fraer'   
}
pg_conn = PG.connect(conn_params)

# MongoDB connection
mongo_client = Mongo::Client.new(['localhost:27017'], database: 'Baza')
mongo_collection = mongo_client[:first]

# Fetch data from PostgreSQL
pg_result = pg_conn.exec("SELECT * FROM employees ")

# Insert data into MongoDB
pg_result.each do |row|
  #puts row
 #mongo_collection.insert_one(row)
end

mongo_collection.find({},{projection: {city:true}}).each do |document|
  puts document
end

#rez = mongo_collection.find({city:'London'})

#rez = mongo_collection.find().sort({first_name:1})

# mongo_collection.find({},{city:true})

#puts "Data copied from PostgreSQL to MongoDB successfully!"

# Close connections
pg_conn.close
mongo_client.close
