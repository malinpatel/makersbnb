
class Request
  include DataMapper::Resource

  property :id, Serial
  property :start_date, Date
  property :end_date, Date

  belongs_to  :property
  belongs_to  :user

  def initialize params
    self.start_date = params[:start_date]
    self.end_date = params[:end_date]
  end
  
end
