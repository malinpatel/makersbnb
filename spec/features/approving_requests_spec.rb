require 'spec_helper'

feature 'Approving requests' do
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
    log_out
    log_in host
    visit '/requests/view'
  end

  scenario "I want to approve a request" do
    click_button 'approve-request'
    expect(Request.get(1).accepted).to be(true)
    expect(page).to have_content "Request accepted"
  end

  scenario "I want to reject a request" do
    click_button 'reject-request'
    expect(Request.get(2).accepted).to be(false)
    expect(page).to have_content "Request denied"
  end
end
