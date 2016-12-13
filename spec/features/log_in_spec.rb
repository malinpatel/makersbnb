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
  # scenario "I want to not be able to login with the wrong password" do
  #   user_1 = User.new(first_name: "Dan", last_name: "Tom", username: "dan", email: "dan@gmail.com", password: "1234")
  #   user_2 = User.new(first_name: "Dan", last_name: "Tom", username: "dan", email: "dan@gmail.com", password: "12345")
  #   sign_up(user_1)
  #   log_out
  #   log_in_wrong_password(user_2)
  #   expect(page).to have_content 'Welcome Visitor!'
  # end
end
