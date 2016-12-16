require 'spec_helper'

feature 'Resetting password' do
  scenario "When I forget my password I want to see a link to reset" do
    visit '/sessions/new'
    click_link "Forgotten password"
    expect(page).to have_content "Please enter your email address"
  end

  scenario "When I enter my email I am told to check my inbox" do
    visit '/sessions/new'
    click_link "Forgotten password"
    fill_in 'recover', with: 'user@gmail.com'
    click_button 'Submit'
    expect(page).to have_content("Please check your inbox")
  end

  scenario "When I click the link in my email I want to reset my password" do
    
  end
end
