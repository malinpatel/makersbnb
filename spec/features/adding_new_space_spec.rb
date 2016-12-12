require 'spec_helper'

RSpec.feature "Adding new space", :type => :feature do
  include Helpers

  scenario "User adds new space for rent" do
    user = User.new(first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu123")

    sign_up(user)
    space_count = Space.all.count
    space = Space.new(name: "London Penthouse", description: "3 bed, 1 swimming pool, in-house chef", price: "100", start_date: "2017-01-07", end_date: "2017-01-07")
    list_property(space)

    expect(current_path).to eq('/spaces/view')
    message = "Your property London Penthouse has been listed."
    expect(page).to have_content(message)
    expect(Space.all.count).to eq (space_count + 1)
  end
end
