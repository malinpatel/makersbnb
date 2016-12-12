require 'spec_helper'

RSpec.feature "Adding new space", :type => :feature do

  scenario "User adds new space for rent" do
    sign_up
    space_count = Space.all.count
    visit '/spaces/new'
    space_penthouse_create

    expect(current_path).to eq('/spaces/view')
    message = "Your property London Penthouse has been listed."
    expect(page).to have_content(message)
    expect(Space.all.count).to eq (space_count + 1)
  end
end
