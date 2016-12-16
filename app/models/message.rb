class Message
 include DataMapper::Resource

 property :id, Serial
 property :time, DateTime
 property :sender, Integer
 property :content, Text

 belongs_to :request

 def initialize params
   self.time = params[:time]
   self.sender = params[:user_id]
   self.content = params[:content]
 end

end
