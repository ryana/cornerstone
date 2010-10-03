if m = Harmony[:mongo]
  MongoMapper.connection = Mongo::Connection.new(m[:host], m[:port], :logger => Rails.logger)
  MongoMapper.database = m[:database]

  if m[:auth]
    MongoMapper.database.authenticate(m[:auth][:username],
                                      m[:auth][:password])
  end
end
