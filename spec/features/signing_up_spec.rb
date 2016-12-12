require 'spec_helper'

RSpec.feature "Sign up", :type => :feature do

  scenario "User signs up" do
    user_count = User.all.count
    sign_up

    expect(current_path).to eq '/spaces/view'
    message = "Welcome to MakersBnB, Malin"
    expect(page).to have_content(message)
    expect(User.all.count).to eq (user_count + 1)
  end
end
