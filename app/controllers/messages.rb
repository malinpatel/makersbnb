class MakersBNB < Sinatra::Base

  post '/messages' do
    params[:user_id] = session[:id]
    message = Message.new params
    request = Request.get params[:request_id]
    request.messages << message
    message.save
    redirect "/requests/#{params[:request_id]}"
  end
end
