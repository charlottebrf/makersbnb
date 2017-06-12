feature 'user signup' do

  scenario 'user can see a signup page' do
    visit '/signup'
    expect(page.status_code).to eq 200
  end

  scenario 'user can fill in signup form fields' do
    visit '/signup'
    fill_in 'name', with: 'Jenny'
    fill_in 'username', with: 'wemmm'
    fill_in 'email', with: 'emails@email.com'
    click_button 'submit'
    expect(page).to have_content('Hello, Jenny!')
  end

end
