require './app/app'
require 'spec_helper'

feature "Homepage" do
  include Helpers

  user = {first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu123"}

  scenario "user clicks logo in nav bar to go to homepage" do
    visit '/spaces/view'
    page.find(:xpath, '//a[@id="go-home"]').click
    expect(current_path).to eq("/")
  end

  scenario "user visits page for the first time" do
    visit "/"
    expect(page).to have_xpath("//input[@value='SIGN UP']")
    expect(page).to have_xpath("//input[@value='LOG IN']")
    click_button("SIGN UP")
    expect(current_path).to eq("/users/new")
  end

  scenario "user visits page to log in" do
    visit "/"
    expect(page).to have_xpath("//input[@value='SIGN UP']")
    expect(page).to have_xpath("//input[@value='LOG IN']")
    click_button("LOG IN")
    expect(current_path).to eq("/sessions/new")
  end

  scenario "logged in user visits homepage" do
    sign_up(user)
    page.find(:xpath, '//a[@id="go-home"]').click
    expect(page).to have_xpath("//input[@value='VIEW SPACES']")
    expect(page).to have_xpath("//input[@value='VIEW REQUESTS']")
    click_button("VIEW SPACES")
    expect(current_path).to eq("/spaces/view")
    page.find(:xpath, '//a[@id="go-home"]').click
    click_button("VIEW REQUESTS")
    expect(current_path).to eq("/requests/view")

  end

end
