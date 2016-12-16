require 'spec_helper'

RSpec.feature "Sign up", :type => :feature do
  include Helpers

    user_count = User.all.count
    user_1 = {
      first_name: "Malin",
      last_name: "Patel",
      username: "malina",
      email: "malina@gmail.com",
      password: "gugu123"}

  scenario "User signs up" do
    sign_up(user_1)

    expect(current_path).to eq '/spaces/view'
    message = "Welcome to MakersBnB, Malin"
    expect(page).to have_content(message)
    expect(User.all.count).to eq (user_count + 1)
  end

  scenario "User signs up with registered username" do

    user_2 = {first_name: "Mal", last_name: "Pat", username: "malina", email: "mal@gmail.com", password: "1234"}
    sign_up(user_1)
    log_out
    sign_up(user_2)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content("Username is already taken")
    expect(User.all.count).to eq(user_count + 1)
  end

  scenario "User tries to sign up with mismatching passwords" do
    visit '/users/new'
    fill_in 'first_name', with: user_1[:first_name]
    fill_in 'last_name', with: user_1[:last_name]
    fill_in 'username', with: user_1[:username]
    fill_in "email", with: user_1[:email]
    fill_in "password", with: user_1[:password]
    fill_in "password_confirmation", with: "invalido"
    click_button "submit"
    expect(current_path).to eq('/users/new')
    message = "Password does not match the confirmation"
    expect(page).to have_content(message)
    expect(User.all.count).to eq(user_count)
  end
end
