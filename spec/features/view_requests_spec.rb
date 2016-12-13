require 'spec_helper'

feature "viewing requests" do
  include Helpers

  let(:user) do
    {first_name: "Malin",
     last_name: "Patel",
     username: "malina",
     email: "malina@gmail.com",
     password: "gugu123"}
    end

  let(:user2) do
    {first_name: "Pea",
     last_name: "Crystal",
     username: "pea",
     email: "pea@gmail.com",
     password: "secret"}
  end


  let(:penthouse) do
    {name: "London Penthouse",
    description: "Lovely big city flat in Whitechapel E1",
    price: 100,
    start_date: '2015-01-01',
    end_date: '2016-01-01'} end

  let(:hovel) do
    {name: "Baldrick's Hovel",
    description: "A hole located in Bethnal Green",
    price: 10,
    start_date: '2015-01-01',
    end_date: '2016-01-01'} end

    before(:each) do
      sign_up(user)
      list_property(penthouse)
      log_out
      sign_up(user2)
      make_request(Space.first)
    end

    scenario "View requests I have made" do
      visit '/requests/view'
      expect(page).to have_content penthouse[:name]
    end

end
