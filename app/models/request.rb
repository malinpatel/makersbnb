
class Request
  include DataMapper::Resource

  property :id, Serial
  property :date, Date
  property :accepted, Boolean

  belongs_to  :space
  belongs_to  :user

  def initialize params
    self.date = params[:date]
    self.accepted = false
  end

end
