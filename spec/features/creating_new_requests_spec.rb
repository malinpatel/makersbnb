require './app/app'

feature "Creating new requests" do
  include Helpers

  scenario "a guest creates a new request" do
    user = User.new(first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu123")

    user_2 = User.new(first_name: "Pea", last_name: "Crystal", username: "pea", email: "pea@gmail.com", password: "secret")

    space = Space.new(name: "London Penthouse", description: "3 bed, 1 swimming pool, in-house chef", price: "100", start_date: "2017-01-01", end_date: "2017-12-31")

    sign_up(user)
    list_property(space)
    sign_up(user2)

    visit '/spaces/view'
    click_button "View property"
    fill_in "start_date", with: "2017-01-01"
    fill_in "end_date", with: "2017-01-03"
    click_button "Book"
    expect(current_path).to eq('/spaces/view')
    expect(page).to have_content("Your booking request for London Penthouse has been sent to the owner")
  end
end
