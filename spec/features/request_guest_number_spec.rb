require 'spec_helper'

feature 'Request guest number' do
  include Helpers
  scenario "I want to allow a maximum number of guests" do
    user = {first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu123"}
    user2 = {first_name: "Pea", last_name: "Crystal", username: "pea", email: "pea@gmail.com", password: "secret"}
    space = {name: "London Penthouse", description: "3 bed, 1 swimming pool, in-house chef", price: "100", start_date: "2017-01-01", end_date: "2017-12-12", capacity: '4'}
    sign_up(user)
    list_property(space)
    sign_up(user2)
    visit '/spaces/view'
    visit '/spaces/view'
    click_link "space-title-5"
    fill_in "date_field", with: "2017-01-01"
    fill_in "number_of_guests", with: '5'
    click_button "Book"

    expect(page).to have_content("Maximum number of guests exceeded.")
  end
end
