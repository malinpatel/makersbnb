class MakersBNB < Sinatra::Base
  
  helpers do
    def current_user
      User.get session[:id]
    end
  end

  get '/' do
    erb :home
  end

end
