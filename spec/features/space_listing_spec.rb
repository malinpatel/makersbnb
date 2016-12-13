require 'spec_helper'

feature 'listing spaces' do
  include Helpers
  let(:penthouse) do
    {name: "London Penthouse",
    description: "Lovely big city flat in Whitechapel E1",
    price: 100,
    start_date: '2016-01-01',
    end_date: '2018-01-01'} end
  let(:hovel) do
    {name: "Baldrick's Hovel",
    description: "A hole located in Bethnal Green",
    price: 10,
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
end
