require_relative '../app/models/user.rb'


describe User do
  subject(:user) {described_class.new}
  context "#properties" do
    it {should have_property :id}
    it {should have_property :email}
  end
end
