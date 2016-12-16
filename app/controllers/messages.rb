class MakersBNB < Sinatra::Base

  post '/messages' do
    message = Message.new params
    request = Request.get params[:request_id]
    current_user.messages << message
    request.messages << message
    message.save
    redirect "/requests/#{params[:request_id]}"
  end
end
