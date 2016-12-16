class MakersBNB < Sinatra::Base

  helpers do
    def current_user
      User.get session[:id]
    end
  end

  get '/' do
    if current_user
      erb :'spaces/view'
    else
      erb :'users/new'
    end
  end

end
