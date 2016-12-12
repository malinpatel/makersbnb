require 'spec_helper'

RSpec.feature "Sign up", :type => :feature do
  include Helpers

  scenario "User signs up" do
    user = User.new(first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu123")
    user_count = User.all.count
    sign_up(user)

    expect(current_path).to eq '/spaces/view'
    message = "Welcome to MakersBnB, Malin"
    expect(page).to have_content(message)
    expect(User.all.count).to eq (user_count + 1)
  end
end
