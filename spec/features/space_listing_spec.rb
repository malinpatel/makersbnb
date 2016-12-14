require 'spec_helper'

feature 'listing spaces' do
  include Helpers
  let(:penthouse) do
    {name: "London Penthouse",
    description: "Lovely big city flat in Whitechapel E1",
    price: 100,
    capacity: 6,
    start_date: '2016-01-01',
    end_date: '2018-01-01'} end
  let(:hovel) do
    {name: "Baldrick's Hovel",
    description: "A hole located in Bethnal Green",
    price: 10,
    capacity: 2,
    start_date: '2016-01-01',
    end_date: '2018-01-01'} end
  let(:user) do
     {first_name: "Malin",
      last_name: "Patel",
      username: "malina",
      email: "malina@gmail.com",
      password: "gugu123"}
   end
  before :each  do
    sign_up(user)
    list_property(penthouse)
    list_property(hovel)
  end

  scenario 'I want to see two spaces' do
    visit '/spaces/view'
    expect(page).to have_content "London Penthouse"
    expect(page).to have_content "Baldrick's Hovel"
  end

  scenario 'I want to view the start and end dates of a listing' do
    visit '/spaces/view'
    click_link('London Penthouse')
    expect(page).to have_content "Start date: 2016-01-01"
    expect(page).to have_content "End date: 2018-01-01"
  end

  scenario "I want to select my dates from a calendar" do
    visit '/spaces/new'
    expect(page).to have_xpath '//input[@id="start_date" and @type="date"]'
    expect(page).to have_xpath '//input[@id="end_date" and @type="date"]'

  end

  scenario "I shouldn't be able to list a property as a visitor" do
    log_out
    visit '/spaces/new'
    list_property(penthouse)
    expect(page).to have_content "Something went wrong. Make sure you're logged in!"
  end
end
