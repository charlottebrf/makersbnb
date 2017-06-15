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

    scenario "I can add multiple spaces" do
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

feature 'Adding dates to spaces' do
  scenario 'I can see a date field' do
    request_space_booking
    expect(page).to have_content 'You Have Requested Amazingly Romantic Shed
                                  for 18/06/2017'
  end

  scenario 'I can\'t request a space without selecting a date' do
    sign_up
    new_space
    visit '/spaces'
    within 'li#1'
    click_button 'request_space'
    expect(page).to have_content 'You must select a date to make a booking'
  end

  scenario 'I can see my requested dates when I log out and log in' do
    request_space_booking
    click_button 'Log Out'
    sign_in
    expect(page).to have_content 'You Have Requested Amazingly Romantic Shed
                                  for 18/06/2017'
  end
end
end
