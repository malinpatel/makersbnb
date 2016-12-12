ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class MakersBNB < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, "himitsu"
  register Sinatra::Flash

  helpers do
    def current_user
      User.get session[:id]
    end
  end

  get '/' do
    erb :home
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new params
    session[:id] = user.id if user.save
    redirect '/spaces'
  end

  get '/spaces' do
    erb :'spaces/index'
  end

  get '/sessions/delete' do
    erb :'sessions/delete'
  end

  delete '/sessions' do
    flash.next[:notice] = "Goodbye #{current_user.first_name}"
    session[:id] = nil
    redirect "/"
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
