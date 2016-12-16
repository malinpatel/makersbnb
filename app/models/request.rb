
class Request
  include DataMapper::Resource

  property :id, Serial
  property :date, Date
  property :accepted, Boolean
  property :rejected, Boolean
  property :no_guests, String

  belongs_to  :space
  belongs_to  :user
  has n, :messages

  def initialize params
    self.date = params[:date]
    self.no_guests = params[:no_guests]
    self.rejected = false
    self.accepted = false
  end

  def pending?
    !(self.accepted || self.rejected)
  end

  def status
    return "pending" if pending?
    return "accepted" if self.accepted
    return "rejected" if self.rejected
  end
end
