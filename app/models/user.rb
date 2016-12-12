require 'bcrypt'

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

  def initialize params
    self.username = params[:username]
    self.email = params[:email]
    self.password = params[:password]
    self.first_name = params[:first_name]
    self.last_name = params[:last_name]
  end

  def password= password
    self.password_digest = Password.create password
  end


end
