class MakersBNB < Sinatra::Base

  get '/requests/new' do
    if current_user
      @space = Space.get session[:space_id]
      erb :'requests/new'
    else
      flash.next[:notice] = ["Sign up to book your space"]
      redirect '/users/new'
    end
  end

  post '/requests' do
    space = Space.get(session[:space_id])
    if space.is_available? Date.parse params[:date]
      request = Request.new params
      current_user.requests << request
      space.requests << request

      if request.no_guests.to_i  > space.capacity
        flash.next[:error] = ["Maximum number of guests exceeded."]
        redirect "spaces/#{space.id}"
      else
        if request.save
          flash.next[:notice] = ["Your booking request for #{space.name} has been sent to the owner"]
          session[:space_id] = nil
        end
      end

    else
      flash.next[:error] = ["Sorry, #{space.name} is unavailable on #{params[:date]}"]
    end
    redirect 'spaces/view'
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
    request.accepted = true
    request.save
    redirect 'requests/view'

  end

end
