
class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Integer
  property :start_date, Date
  property :end_date, Date
  property :capacity, Integer
  property :image, FilePath

  belongs_to :user
  has n, :requests

  validates_presence_of :name, :price, :start_date, :end_date, :capacity

  def initialize params
    self.name = params[:name]
    self.description = params[:description]
    self.price = params[:price]
    self.start_date = params[:start_date]
    self.end_date = params[:end_date]
    self.capacity = params[:capacity].to_i
  end

  def is_available? date
    if date >= self.start_date && date <= self.end_date
      return true if date_not_booked?(date)
    end
    false
  end

  private

  def date_not_booked?(date)
    self.requests.select(&:accepted).each do |request|
      return false if date == request.date
    end
  end

end
