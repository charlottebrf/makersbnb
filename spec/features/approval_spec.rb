require 'web_helper'

feature 'Notifying User of Request Status' do

    scenario 'I can see whether my request is approved' do
      makes_user_makes_space_makes_request_approves
      expect(page).to have_content("Your request for Mike's Space was approved!")
    end

    scenario 'I can see whether my request is denied' do
      makes_user_makes_space_makes_request_denies
      expect(page).to have_content("Your request for Mike's Space was denied!")
    end

    scenario 'I can see whether my request is still pending' do
      makes_user_makes_space_makes_request_leaves_pending
      expect(page).to have_content("Your request for Mike's Space is pending approval!")
    end

end
