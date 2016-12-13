class MakersBNB < Sinatra::Base

  get '/sessions/delete' do
    erb :'sessions/delete'
  end

  delete '/sessions' do
    flash.next[:notice] = ["Goodbye #{current_user.first_name}"]
    session[:id] = nil
    redirect "/"
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params)
    if user
      session[:id] = user.id
    else
      flash[:notice] = ['The email or password is incorrect']
    end
    redirect '/spaces/view'
  end

end
