require 'spec_helper'

feature "Log in" do
  scenario "I want to log in" do
    sign_up
    log_out
    log_in
    expect(page).to have_content 'Welcome Malin'
  end
  scenario "I want to not be able to login with the wrong password" do
    sign_up
    log_out
    log_in_wrong_password
    expect(page).to have_content 'Welcome Visitor!'
  end
end
