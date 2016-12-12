
class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Integer
  property :dates, Date

  belongs_to :user

  def initialize params
    self.name = params[:name]
    self.description = params[:description]
    self.price = params[:price]
    self.dates = params[:dates]
  end
end
