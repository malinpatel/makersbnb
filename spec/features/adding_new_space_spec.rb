require 'spec_helper'

RSpec.feature "Adding new space", :type => :feature do

  scenario "User adds new space for rent" do
    sign_up
    space_count = Space.all.count
    visit '/spaces/new'
    fill_in "name", with: "London Penthouse"
    fill_in "description", with: "3 bed, 1 swimming pool, in-house chef"
    fill_in "price", with: "100"
    fill_in "start_date", with: '2017-01-07'
    fill_in "end_date", with: '2017-03-07'
    click_button "List space"

    expect(current_path).to eq('/spaces/view')
    message = "Your property London Penthouse has been listed."
    expect(page).to have_content(message)
    expect(Space.all.count).to eq (space_count + 1)
  end
end
