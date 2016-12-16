require 'spec_helper'


feature 'Resetting password' do
  include Helpers

    let(:user) do
       {first_name: "Malin",
        last_name: "Patel",
        username: "malina",
        email: "malina@gmail.com",
        password: "gugu123"} end
      before :each  do
        sign_up(user)
      end

  scenario "When I forget my password I want to see a link to reset" do
    visit '/sessions/new'
    click_link "Forgotten password"
    expect(page).to have_content "Please enter your email address"
  end

  scenario "When I enter my email I am told to check my inbox" do
    visit '/sessions/new'
    click_link "Forgotten password"
    fill_in 'recover', with: 'malina@gmail.com'
    click_button 'Submit'
    expect(page).to have_content("Please check your inbox")
  end



  scenario "assigned a rest token to the user when they recover" do
    require 'pry'; binding.pry
    expect{recover_password}.to change{User.first.password_token}


  end
end
