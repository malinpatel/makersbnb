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

  scenario "User signs up with registered username" do
    user_1 = {first_name: "Dan", last_name: "Tom", username: "dan", email: "dan@gmail.com", password: "1234"}
    user_2 = {first_name: "Mal", last_name: "Patel", username: "dan", email: "mal@gmail.com", password: "1234"}

    sign_up(user_1)
    log_out
    sign_up(user_2)

    expect(page).to have_content("Something went wrong. Make sure you've given correct sign-up details!")

  end
end
