require './app/app'
require 'spec_helper'

RSpec.feature "Sign up", :type => :feature do

  scenario "User signs up" do
    user_count = User.all.count
    visit '/users/new'
    fill_in 'first_name', with: "Malin"
    fill_in 'last_name', with: "Patel"
    fill_in 'username', with: "malina"
    fill_in "email", with: "malina@gmail.com"
    fill_in "password", with: "gugu123"
    click_button "submit"

    expect(current_path).to eq '/spaces'
    message = "Welcome to MakersBnB, Malin"
    expect(page).to have_content(message)
    expect(User.all.count).to eq (user_count + 1)
  end
end
