feature "Listing Spaces" do

  scenario "I can create a new Space" do

    visit("/spaces")
    expect(page).to_not have_content("Space #1")
    click_button("make_new_space")
    click_button("submit")
    expect(page).to have_content("Space #1")

  end

  scenario "I can add a space to a database" do
    visit("/spaces")
    click_button("make_new_space")
    fill_in 'new_space', with: 'Maldives'
    click_button('submit')
    expect(Space.last.name).to eq('Maldives')
  end

end
