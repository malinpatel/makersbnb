module Helpers
  def sign_up(user)
    visit '/users/new'
    fill_in 'first_name', with: user.first_name
    fill_in 'last_name', with: user.last_name
    fill_in 'username', with: user.username
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "submit"
  end

  def log_in(user)
    visit '/sessions/new'
    fill_in 'username', with: user.username
    fill_in "password", with: user.password
    click_button 'submit'
  end

  def log_out
    click_link 'logout'
    click_button 'logout-btn'
  end

  def log_in_wrong_password(user)
    visit '/sessions/new'
    fill_in 'username', with: user.username
    fill_in "password", with: user.password
    click_button 'submit'
  end

  def list_property(space)
    visit '/spaces/new'
    fill_in "name", with: space.name
    fill_in "description", with: space.description
    fill_in "price", with: space.price
    fill_in "start_date", with: space.start_date
    fill_in "end_date", with: space.end_date
    click_button "List space"
  end
end
