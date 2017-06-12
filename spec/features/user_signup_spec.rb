feature 'user signup' do

  scenario 'user can see a sign up page' do
    visit '/'
    expect(page.status_code).to eq 200
  end

end
