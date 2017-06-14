require 'web_helper'

feature 'user signup' do

  scenario 'user can see a signup page' do
    visit '/signup'
    expect(page.status_code).to eq 200
  end

  scenario 'user can fill in signup form fields' do
    sign_up
    expect(page).to have_content('Hello, Jenny!')
    expect(User.first.name).to eq('Jenny')
  end

end
