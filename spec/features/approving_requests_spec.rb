require 'spec_helper'

feature 'Approving requests' do
  include Helpers
  let(:penthouse) do
    {name: "London Penthouse",
    description: "Lovely big city flat in Whitechapel E1",
    price: 100,
    start_date: '2016-01-01',
    end_date: '2018-01-01'} end
  scenario "I want to approve a request" do
    user = {first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu123"}
    sign_up(user)
      list_property(penthouse)
      make_request(Space.first)
      visit '/requests/view'
      click_button 'approve'
      expect(Request.get(1).accepted).to be(true)
  end
end
