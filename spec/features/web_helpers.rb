def sign_up
  visit '/users/new'
  fill_in 'first_name', with: "Malin"
  fill_in 'last_name', with: "Patel"
  fill_in 'username', with: "malina"
  fill_in "email", with: "malina@gmail.com"
  fill_in "password", with: "gugu123"
  click_button "submit"
end
