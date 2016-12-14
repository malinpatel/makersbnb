require './app/app'

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
    make_request(Space.first)
  end

  scenario "a guest creates a new request" do
    expect(current_path).to eq('/spaces/view')
    expect(Request.count).to eq 1
    expect(page).to have_content("Your booking request for London Penthouse has been sent to the owner")    
  end

  scenario "A guest tries to request an unavailable date" do
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
end
