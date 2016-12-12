require 'spec_helper'

feature 'listing spaces' do

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
  before :each  do
    user = User.create(username: 'tt', email:'tt@email')
    space1 = Space.new(penthouse)
    space2 = Space.new(hovel)
    user.spaces << space1
    user.spaces << space2
    space1.save
    space2.save
  end

  scenario 'I want to see two spaces' do
    visit '/spaces/view'
    expect(page).to have_content "London Penthouse"
    expect(page).to have_content "Baldrick's Hovel"
  end
end
