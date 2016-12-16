require 'spec_helper'


feature 'Resetting password' do
  include Helpers

    let(:user) do
       {first_name: "Malin",
        last_name: "Patel",
        username: "malina",
        email: "malina@gmail.com",
        password: "gugu123"}
      end

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
    expect{recover_password}.to change{User.first.password_token}
  end

  scenario "it does not allow you to use the token after an hour" do
    user_1 = User.create(first_name: "Malin",
     last_name: "Patel",
     username: "malina",
     email: "malina@gmail.com",
     password: "gugu123")
    recover_password
    Timecop.travel(60 * 60 * 60) do
      visit("/users/reset_password?token=#{user_1.password_token}")
      expect(page).to have_content "Your token is invalid"
    end
  end

  scenario 'it asks for your new password when your token is valid' do
    user_1 = User.create(first_name: "Malin",
     last_name: "Patel",
     username: "malina",
     email: "malina@gmail.com",
     password: "gugu123")
    recover_password
    visit("/users/reset_password?token=#{user_1.password_token}")
    expect(page).to have_content("Please enter your new password")
  end

end
