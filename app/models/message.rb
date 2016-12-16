require 'date'

class Message
 include DataMapper::Resource

 property :id, Serial
 property :time, DateTime
 property :content, Text

 belongs_to :request
 belongs_to :user

 def initialize params
   self.time = DateTime.now
   self.content = params[:content]
 end

end
