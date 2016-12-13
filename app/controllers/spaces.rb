class MakersBNB < Sinatra::Base
  get '/spaces/view' do
    erb :'spaces/view'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  get '/spaces/:space_id' do
    @space = Space.get params[:space_id]
    session[:space_id] = params[:space_id]
    erb :'spaces/id'
  end

  post '/spaces' do
    space = Space.new params
    current_user.spaces << space
    if space.save
      flash.next[:notice] = ["Your property #{space.name} has been listed."]
    else flash.next[:error] = ["Something went wrong. Make sure you're logged in!"]
    end
    redirect '/spaces/view'
  end
end
