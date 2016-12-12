require 'spec_helper'

feature "User logs out" do
  scenario "clicking logout button" do
    sign_up
    click_link 'logout'
    expect(page).to have_content "Are you sure you want to log out?"
    click_button 'logout-btn'
    expect(page).to have_content "Goodbye Malin"
  end
end
