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
    new_space
    sign_up
    visit '/spaces'
    within 'li#1'
    fill_in 'date', with: '18/06/2017'
    click_button 'request_space'
    expect(page).to have_content 'You Have Requested Amazingly Romantic Shed'
  end

feature 'Adding dates to spaces' do
  scenario 'I can see a date field' do
    sign_up
    new_space
    visit '/spaces'
    within 'li#1'
    fill_in 'date', with: '18/06/2017'
    click_button 'request_space'
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
end
end
