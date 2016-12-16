class MakersBNB < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new params
    session[:id] = user.id if user.save
    if session[:id]
      flash.next[:notice] = ["Welcome to MakersBnB, #{current_user.first_name}"]
      redirect '/spaces/view'
    else flash.next[:error] = user.errors.full_messages
      redirect '/users/new'
    end
  end

  get '/users/recover' do
      erb :'users/recover'
  end

  post '/users/recover' do
    flash.next[:notice] = ['Please check your inbox']
    user = User.first(email: params[:email])
    user.password_token = "SFD"
    user.save

    # require 'pry'; binding.pry
    # user.password_token = "dfsdfs"
    redirect '/users/recover'
  end


end
