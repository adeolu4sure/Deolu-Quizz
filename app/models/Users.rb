class Users
	include DataMapper::Resource
property :id, Serial
property :email, String
property :password, Text
property :role, Boolean
end

DataMapper.finalize.auto_upgrade!