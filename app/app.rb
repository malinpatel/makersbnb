ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class MakersBNB < Sinatra::Base
  enable :sessions
  set :session_secret, "himitsu"
  register Sinatra::Flash

  get '/' do
    'Hello MakersBNB!'
  end

  get 'users/new' do
    erb :'users/new'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
