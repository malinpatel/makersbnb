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
    end
  end
end
