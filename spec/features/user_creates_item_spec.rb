require 'rails_helper'

feature 'user creates item', %{
  As a signed up user
  I want to create new item
  So that other users can rate and review it
} do
  scenario 'creates item succcessfully' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_on 'Create Item'

    fill_in 'Name', with: "item.name"
    fill_in 'Description', with: "item.description"
    fill_in 'Where to Purchase', with: "item.purchase_url"
    fill_in 'Image URL', with: "item.image"

    click_on "Add Item"

    expect(page).to have_content("Item added.")
    expect(page).to have_content("item.description")
  end

  scenario 'create unsucccessful item, without name' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_on 'Create Item'

    fill_in 'Name', with: ""
    fill_in 'Description', with: "item.description"
    fill_in 'Where to Purchase', with: "item.purchase_url"
    fill_in 'Image URL', with: "item.image"

    click_on "Add Item"
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'user forgets description field' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_on 'Create Item'

    fill_in 'Name', with: "item.name"
    fill_in 'Description', with: ""
    fill_in 'Where to Purchase', with: "item.purchase_url"
    fill_in 'Image URL', with: "item.image"

    click_on "Add Item"

    expect(page).to have_content("Description can't be blank")
  end
end
