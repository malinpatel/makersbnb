require 'bcrypt'

class User

  property :id, Serial
  property :email, Text
  property :name, String
  property :username, String
  property :password_digest, Text

  has n, :spaces
  has n, :requests



end
