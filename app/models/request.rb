
class Request
  include DataMapper::Resource

  property :id, Serial
  property :date, Date
  property :accepted, Boolean
  property :rejected, Boolean
  property :no_guests, String

  belongs_to  :space
  belongs_to  :user

  def initialize params
    self.date = params[:date]
    self.no_guests = params[:no_guests]
    self.rejected = false
    self.accepted = false
  end

end
