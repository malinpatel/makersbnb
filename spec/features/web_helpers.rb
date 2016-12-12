def sign_up
  visit '/users/new'
  fill_in 'first_name', with: "Malin"
  fill_in 'last_name', with: "Patel"
  fill_in 'username', with: "malina"
  fill_in "email", with: "malina@gmail.com"
  fill_in "password", with: "gugu123"
  click_button "submit"
end

def log_in
  visit '/sessions/new'
  fill_in 'username', with: "malina"
  fill_in "password", with: "gugu123"
  click_button 'submit'
end

def log_out
  click_link 'logout'
  click_button 'logout-btn'
end

def log_in_wrong_password
  visit '/sessions/new'
  fill_in 'username', with: "malina"
  fill_in "password", with: "g"
  click_button 'submit'
end
