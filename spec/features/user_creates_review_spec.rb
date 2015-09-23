require 'rails_helper'

feature 'user creates review', %{
  As a signed up user
  I want to create new review
  So that other users can see what I think of the item
} do
  scenario 'creates review succcessfully' do
    item = FactoryGirl.create(:item)

    sign_in(item.user)

    click_on item.category.name

    click_on item.name

    click_on 'Add Review'

    choose 3

    fill_in "Description", with: "Soaks through"

    click_on "Create Review"

    expect(page).to have_content("Review added.")
    expect(page).to have_content("Soaks through")
  end

  scenario 'create unsucccessful review, without rating' do
    item = FactoryGirl.create(:item)

    sign_in(item.user)

    click_on item.category.name

    click_on item.name

    click_on 'Add Review'

    fill_in "Description", with: "Soaks through"

    click_on "Create Review"

    expect(page).to have_content("Rating can't be blank")
  end

  scenario 'create unsucccessful review, without description' do
    item = FactoryGirl.create(:item)

    sign_in(item.user)

    click_on item.category.name

    click_on item.name

    click_on 'Add Review'

    choose 3

    fill_in "Description", with: ""

    click_on "Create Review"

    expect(page).to have_content("Description can't be blank")
  end
end
