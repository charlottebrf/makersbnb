
def new_space
  visit("/spaces")
  expect(page).to_not have_content("Amazingly Romantic Shed")
  click_button("make_new_space")
  fill_in 'name', with: 'Amazingly Romantic Shed'
  click_button("submit")
end
