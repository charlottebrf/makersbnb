
def new_space
  visit("/spaces")
  expect(page).to_not have_content("Amazingly Romantic Shed")
  click_button("make_new_space")
  fill_in 'name', with: 'Amazingly Romantic Shed'
  fill_in 'description', with: 'A shed that is romantic to an amazing degree.'
  click_button("submit")
end
