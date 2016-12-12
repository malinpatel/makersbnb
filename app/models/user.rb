require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :email, Text
  property :first_name, String
  property :last_name, String
  property :username, String
  property :password_digest, Text

  # has n, :spaces
  # has n, :requests



end
