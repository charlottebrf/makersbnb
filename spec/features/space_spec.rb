require 'web_helper'

feature "Listing Spaces" do

    scenario "I can name a new Space" do
      new_space
      expect(page).to have_content "Amazingly Romantic Shed"
    end

    scenario "I can describe a new Space" do
      new_space
      expect(page).to have_content "A shed that is romantic to an amazing degree."
    end

    scenario "I can provide a price for a new Space" do
      new_space
      expect(page).to have_content "50"
    end

    scenario "I can add a space to a database" do
      new_space("Maldives")
      expect(Space.last.name).to eq('Maldives')
    end

    scenario "I can add a space to a database" do
      new_space("Maldives")
      new_space("Room 101")
      expect(page).to have_content('Maldives')
      expect(page).to have_content('Room 101')
    end

end

feature 'Booking Spaces' do

  scenario 'I can request a space for one night' do
    request_space
    expect(page).to have_content 'You Have Requested: Amazingly Romantic Shed'
  end

  scenario 'I recieve a request for approval' do
    request_space
    click_button 'Log Out'
    sign_in
    expect(page).to have_content 'Dave has requested Amazingly Romantic Shed'
  end

  scenario 'I can approve a booking request' do
    request_space
    click_button 'Log Out'
    sign_in
    expect(page).to have_button 'Approve Request'
  end

  scenario 'I can deny a booking request' do
    request_space
    click_button 'Log Out'
    sign_in
    expect(page).to have_button 'Deny Request'
end

  scenario 'Requests that are approved... are approved!', :js => true do
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
    click_button('Request Space')
    click_button('Approve Request')
    sleep(5)
    request = Booking.last
    expect(request.approved).to eq true
  end
end
