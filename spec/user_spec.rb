require_relative '../app/models/user.rb'
require 'spec_helper'


describe User do

  let(:params) do
    {username: "malina",
    password: 'gugu123',
    email: 'malina@gmail.com',
    first_name: 'Malin',
    last_name: 'Patel'} end
  subject(:user) {described_class.new params}
  context "#properties" do
    it "only creates new user if valid email address provided" do
      params = {first_name: "Malin", last_name: "Patel", username: "malina", email: "invalido", password: "gugu123"}
      count = User.count
      user = User.new(params)
      user.save
      expect(User.count).to eq count
    end
  end
  it "should generate a token" do
    expect{user.generate_token}.to change{user.password_token}
  end
  it "saves a password recovery token time when we generate a token using" do
    Timecop.freeze do
      user.generate_token
      expect(user.password_token_time).to eq Time.now
    end
  end
end
