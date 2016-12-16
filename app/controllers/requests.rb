class MakersBNB < Sinatra::Base

  get '/requests/new' do
    if current_user
      @space = Space.get session[:space_id]
      erb :'requests/new'
    else
      flash.next[:error] = ["Sign up to book your space"]
      redirect '/users/new'
    end
  end

  post '/requests' do
    space = Space.get(session[:space_id])
    begin
    if space.is_available? Date.parse params[:date]
      request = Request.new params
      current_user.requests << request
      space.requests << request
      if request.no_guests.to_i  > space.capacity
        flash.next[:error] = ["Maximum number of guests exceeded."]
        redirect "spaces/#{space.id}"
      else
        request.save
        flash.next[:notice] = ["Your booking request for #{space.name} has been sent to the owner"]
        session[:space_id] = nil
        redirect '/requests/view'
      end
    else
      flash.next[:error] = ["Sorry, #{space.name} is unavailable on #{Date.parse params[:date]}"]
      redirect 'spaces/view'
    end
    rescue
      flash.next[:error] = ["Please enter a correct date to book"]
      redirect '/requests/new'
    end
  end




  get '/requests/view' do
    if current_user
      erb :'requests/view'
    else flash.next[:error] = ["You have to be logged in to view the requests"]
      redirect 'sessions/new'
    end
  end

  post '/requests/view' do
    request = Request.get(params[:request_id])
    if params[:reply] == "approve"
      request.accepted = true
    else
      request.rejected = true
    end
    request.save
    redirect 'requests/view'
  end

  get '/requests/:req_id' do
    @req = Request.get params[:req_id]
    erb :'requests/id'
  end
end
