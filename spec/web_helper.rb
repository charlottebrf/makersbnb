
def new_space(name = "Amazingly Romantic Shed", description = "A shed that is romantic to an amazing degree.", price = 50)
  visit("/spaces")
  expect(page).to_not have_content(name)
  click_button("make_new_space")
  fill_in 'name', with: name
  fill_in 'description', with: description
  fill_in "price", with: price
  click_button("submit")
end

def sign_up(name = 'Jenny', username = 'wemmm',
            email = 'emails@email.com',
            password = 'password', password_confirmation = 'password')
  visit '/signup'
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'submit'

end

def sign_in(username = 'wemmm', password = 'password')
  visit "/home"
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Log In'
end

def request_space
  sign_up
  new_space
  visit '/home'
  click_button 'Log Out'
  sign_up('Dave', 'dave')
  visit '/spaces'
  within 'li#1'
  click_button 'request_space'
end
