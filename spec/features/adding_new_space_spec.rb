require 'spec_helper'

RSpec.feature "Adding new space", :type => :feature do
  include Helpers
  let(:penthouse) do
    {name: "London Penthouse",
    description: "Lovely big city flat in Whitechapel E1",
    price: 100,
    capacity: 6,
    start_date: '2016-01-01',
    end_date: '2018-01-01'}
  end
  let(:hovel) do
    {name: "Baldrick's Hovel",
    description: "A hole located in Bethnal Green",
    price: 10,
    capacity: 2,
    start_date: '2016-01-01',
    end_date: '2018-01-01'} end
    let(:flat) do
      {name: "3 bedroom flat",
      description: ' ' ,
      price: ' ',
      capacity: 2,
      start_date: ' ',
      end_date: ' ' } end


  before :each  do
    user = {first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu123"}
    sign_up(user)
    list_property(penthouse)
    list_property(hovel)
  end

  scenario "User adds new space for rent" do
    space_count = Space.all.count
    space = {name: "London Penthouse", capacity: 4, description: "3 bed, 1 swimming pool, in-house chef", price: "100", start_date: "2017-01-07", end_date: "2017-01-07"}
    list_property(space)

    expect(current_path).to eq('/spaces/view')
    message = "Your property London Penthouse has been listed."
    expect(page).to have_content(message)
    expect(Space.all.count).to eq (space_count + 1)
  end

  scenario "I want to select my dates from a calendar" do
    visit '/spaces/new'
    expect(page).to have_xpath '//input[@id="start_date" and @type="date"]'
    expect(page).to have_xpath '//input[@id="end_date" and @type="date"]'
  end

  scenario "I shouldn't be able to list a property as a visitor" do
    log_out
    visit '/spaces/new'
    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content "Something went wrong. Make sure you're logged in!"
  end
  scenario "I want to receive a notice if I try to add a space with incomplete fields" do
    list_property(flat)
    expect(current_path).to eq('/spaces/new')
    expect(page).to have_content("Please fill in all the fields")
  end
end
