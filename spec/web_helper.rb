
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
  fill_in 'date', with: '08/01/1935'
  click_button 'request_space'
end

def incorrect_password_verification(name = 'Jenny', username = 'wemmm',
            email = 'emails@email.com',
            password = 'password', password_confirmation = 'wasspord')
  visit '/signup'
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'submit'
end

def request_space_booking
  sign_up
  new_space
  visit '/spaces'
  within 'li#1'
  fill_in 'date', with: '18/06/2017'

  click_button 'request_space'
end

def makes_user_makes_space_makes_request_approves
  visit('/home')
  click_button('Sign Up')
  fill_in 'name', with: 'Michael'
  fill_in 'username', with: 'mikejacobson'
  fill_in 'email', with: 'michael.jacobson89@gmail.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button('submit')
  click_button('View Spaces')
  click_button('Make New Space')
  fill_in 'name', with: "Mike's Space"
  fill_in 'description', with: "It's ace!"
  fill_in 'price', with: 200
  click_button('submit')
  fill_in 'date', with: '08/01/1935'
  click_button('Request Space')
  click_button('Approve Request')
  sleep(1)
end

def makes_user_makes_space_makes_request_denies
  visit('/home')
  click_button('Sign Up')
  fill_in 'name', with: 'Michael'
  fill_in 'username', with: 'mikejacobson'
  fill_in 'email', with: 'michael.jacobson89@gmail.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button('submit')
  click_button('View Spaces')
  click_button('Make New Space')
  fill_in 'name', with: "Mike's Space"
  fill_in 'description', with: "It's ace!"
  fill_in 'price', with: 200
  click_button('submit')
  fill_in 'date', with: '08/01/1935'
  click_button('Request Space')
  click_button('Deny Request')
  sleep(1)
end

def makes_user_makes_space_makes_request_leaves_pending
  visit('/home')
  click_button('Sign Up')
  fill_in 'name', with: 'Michael'
  fill_in 'username', with: 'mikejacobson'
  fill_in 'email', with: 'michael.jacobson89@gmail.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button('submit')
  click_button('View Spaces')
  click_button('Make New Space')
  fill_in 'name', with: "Mike's Space"
  fill_in 'description', with: "It's ace!"
  fill_in 'price', with: 200
  click_button('submit')
  fill_in 'date', with: '08/01/1935'
  click_button('Request Space')
  sleep(1)
end
