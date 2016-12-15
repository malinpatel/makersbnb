require './app/app'
require 'spec_helper'

feature "Creating new requests" do
  include Helpers

  user = {first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu123"}
  user2 = {first_name: "Pea", last_name: "Crystal", username: "pea", email: "pea@gmail.com", password: "secret"}
  user3 = {first_name: "Test", last_name: "McTestface", username: "t3st", email: "test@gmail.com", password: "12345"}
  space = {name: "London Penthouse", description: "3 bed, 1 swimming pool, in-house chef", price: "100", start_date: "2017-01-01", end_date: "2017-12-12", capacity: '4'}

  before(:each) do
    sign_up(user)
    list_property(space)
    sign_up(user2)

  end

  scenario "a guest creates a new request" do
    make_request(Space.first)
    expect(current_path).to eq('/requests/view')
    expect(Request.count).to eq 1
    expect(page).to have_content("Your booking request for London Penthouse has been sent to the owner")
  end

  scenario "A guest tries to request an unavailable date" do
    make_request(Space.first)
    log_out
    log_in user
    visit '/requests/view'
    click_button 'approve'
    log_out
    sign_up user3
    make_request(Space.first)
    expect(page).to have_content "Sorry, London Penthouse is unavailable on 2017-01-01"
    expect(Request.count).to eq 1
  end

  scenario "I can't book a place if I am not logged in" do
    log_out
    visit '/spaces/view'
    click_link "London Penthouse"
    click_button 'Book'
    expect(current_path).to eq('/users/new')
    expect(page).to have_content ("Sign up to book your space")
  end

  scenario "A guest cannot book with incorrect date format" do
    visit '/spaces/view'
    click_link "London Penthouse"
    click_button 'Book'
    fill_in "date-field", with: "yyyy-mm-dd"
    select '4', from: "number-of-guests"
    click_button "Book"
    expect(current_path).to eq('/requests/new')
    message = "Please enter a correct date to book"
    expect(page).to have_content(message)

  end
end
