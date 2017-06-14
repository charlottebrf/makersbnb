require 'web_helper'

feature "User Login System" do

    scenario "I can log in and out after I have signed up" do
      sign_up
      click_button 'Log Out'
      sign_in
      expect(page).to have_content "Hello, Jenny!"
    end
end
