class MakersBNB < Sinatra::Base

  post '/requests' do
    request = Request.new params
    space = Space.get(session[:space_id])
    current_user.requests << request
    space.requests << request
    if request.no_guests.to_i  > space.capacity
        flash.next[:notice] = ["Maximum number of guests exceeded."]
        redirect "spaces/#{space.id}"
    else

      if request.save
        flash.next[:notice] = ["Your booking request for #{space.name} has been sent to the owner"]
        session[:space_id] = nil
      end
    end
    redirect 'spaces/view'
  end

  get '/requests/view' do
    erb :'requests/view'
  end

  post '/requests/view' do
    request = Request.get(params[:request_id])
    request.accepted = true
    request.save
    redirect 'requests/view'

  end

end
