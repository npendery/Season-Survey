require 'rails_helper'

feature 'user creates review', %{
  As a signed up user
  I want to create new review
  So that other users can see what I think of the item
} do
  scenario 'creates review succcessfully' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)

    item = Item.create!(name: "Snow boots", description: "Fluffy", image: "www.zappos.com", purchase_url: "www.zappos.com", user_id: user.id, category_id: category.id)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_on category.name

    click_on item.name

    click_on 'Add Review'

    choose 3
    fill_in "Description", with: "It's big, and hairy"

    click_on "Add Rating"

    expect(page).to have_content("Rating added.")
    expect(page).to have_content("It's big, and hairy")
  end

  scenario 'create unsucccessful review, without rating' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    item = Item.create!(name: "Snow boots", description: "Fluffy", image: "www.zappos.com", purchase_url: "www.zappos.com", user_id: user, category_id: category)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_on 'category.name'

    click_on 'item.name'

    click_on 'Add Review'

    fill_in "Rating", with: ''
    fill_in "Description", with: "It's big, and hairy"

    click_on "Add Rating"

    expect(page).to have_content("Rating can't be blank.")
  end

  scenario 'create unsucccessful review, without description' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    item = Item.create!(name: "Snow boots", description: "Fluffy", image: "www.zappos.com", purchase_url: "www.zappos.com", user_id: user, category_id: category)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_on 'category.name'

    click_on 'item.name'

    click_on 'Add Review'

    fill_in "Rating", with: 3
    fill_in "Description", with: ""

    click_on "Add Rating"

    expect(page).to have_content("Description can't be blank.")
  end
end
