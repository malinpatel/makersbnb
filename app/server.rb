class MakersBNB < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, "himitsu"
  register Sinatra::Flash
  set :app_file, __FILE__

  helpers do
    def current_user
      User.get session[:id]
    end
  end

  get '/' do
    erb :home
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
