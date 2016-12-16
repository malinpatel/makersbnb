require 'spec_helper'


feature "Sending Messages between host and guest" do
  include Helpers
  let(:penthouse) do {
    name: "London Penthouse",
    description: "Lovely big city flat in Whitechapel E1",
    price: '100',
    start_date: '2016-01-01',
    end_date: '2018-01-01',
    capacity: '4'}
   end
  let(:host) do {
    first_name: "Malin",
    last_name: "Patel",
    username: "malina",
    email: "malina@gmail.com",
    password: "gugu123" }
  end
  let(:guest)do {
    first_name: "testy",
    last_name: "mctestface",
    username: "test",
    email: "test@test.com",
    password: "password"
  } end

  before(:each) do
    sign_up host
    list_property(penthouse)
    log_out
    sign_up guest
    make_request
  end

  scenario "Guest wants to message host" do
    click_link '2017-01-01'
    fill_in :'message-new-box', with: "Do you accept pets?"
    click_button "Send"
    within "#messages-container" do
      expect(page).to have_content "Do you accept pets?"
      expect(page).to have_content "test"
    end
  end

  xscenario "Host wants to reply to message" do
    click_link '2017-01-01'
    fill_in :'message-new-box', with: "Do you accept pets?"
    click_button "Send"
    log_out
    log_in host
    visit '/requests/view'
    click_link '2017-01-01'
    fill_in :'message-new-box', with: "No, I hate all vermin. Please jump in a fire from a tall building"
    click_button "Send"
    within "#messages-container" do
      expect(page).to have_content "jump in a fire"
      expect(page).to have_content "malina"
    end
  end
end
