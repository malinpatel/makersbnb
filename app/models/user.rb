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
  has n, :messages

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email, :username, :first_name, :last_name, :password_digest
  validates_uniqueness_of :username, :email
  validates_format_of :email, :as => :email_address

  def initialize params
    self.username = params[:username]
    self.email = params[:email]
    self.password = params[:password]
    self.first_name = params[:first_name]
    self.last_name = params[:last_name]
    self.password_confirmation = params[:password_confirmation]
  end

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate params
    user = User.first :username => params[:username]
    return user if (user && BCrypt::Password.new(user.password_digest) == params[:password])
    return nil
  end


end
