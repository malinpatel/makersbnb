require 'spec_helper'

feature "Log in" do
  include Helpers
  scenario "I want to log in" do
    user = User.new(first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu123")
    sign_up(user)
    log_out
    log_in(user)
    expect(page).to have_content 'Welcome Malin'
  end
  scenario "I want to not be able to login with the wrong password" do
    user = User.new(first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu123")

    user_2 = User.new(first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu1234")

    sign_up(user)
    log_out
    log_in_wrong_password(user_2)
    expect(page).to have_content 'Welcome Visitor!'
  end
end
