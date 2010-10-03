MongoMapper.connection = Mongo::Connection.new('flame.mongohq.com', 27033)
MongoMapper.database = 'cornerstone-dev'
MongoMapper.database.authenticate 'ryan', 'popopo'
