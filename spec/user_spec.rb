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
  end
end
