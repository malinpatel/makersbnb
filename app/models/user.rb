require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :email, Text, unique: true
  property :first_name, String
  property :last_name, String
  property :username, String, unique: true
  property :password_digest, Text

  has n, :spaces
  has n, :requests

  attr_reader :password

  validates_uniqueness_of :username, :email
  validates_format_of :email, :as => :email_address

  def initialize params
    self.username = params[:username]
    self.email = params[:email]
    self.password = params[:password]
    self.first_name = params[:first_name]
    self.last_name = params[:last_name]
  end

  def password= password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate params
    user = User.first :username => params[:username]
    return user if (user && BCrypt::Password.new(user.password_digest) == params[:password])
    return nil
  end


end
