class MakersBNB < Sinatra::Base
  get '/spaces/view' do
    erb :'spaces/view'
  end

  get '/spaces/new' do
    if current_user
      erb :'spaces/new'
    else
     flash.next[:error] = ["Something went wrong. Make sure you're logged in!"]
     redirect '/sessions/new'
    end
  end

  get '/spaces/:space_id' do
    @space = Space.get params[:space_id]
    session[:space_id] = params[:space_id]
    erb :'spaces/id'
  end

  post '/spaces' do
    space = Space.new params
    if !space.is_available?(Date.parse params[:start_date])
      flash.next[:error] = ["End date cannot precede start date"]
      redirect '/spaces/new'
    end
    current_user.spaces << space
    if space.save
      flash.next[:notice] = ["Your property #{space.name} has been listed."]
      redirect '/spaces/view'
    else
      flash.next[:notice] = ["Please fill in all the fields"]
      redirect '/spaces/new'
    end
  end
end
