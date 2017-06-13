
def new_space(name = "Amazingly Romantic Shed", description = "A shed that is romantic to an amazing degree.", price = 50)
  visit("/spaces")
  expect(page).to_not have_content(name)
  click_button("make_new_space")
  fill_in 'name', with: name
  fill_in 'description', with: description
  fill_in "price", with: price
  click_button("submit")
end
