require 'rails_helper'

feature 'user updates item', %{
  As a signed up user
  I want to update an existing item
  So that other users can rate and review it
} do

  before do
  end

  scenario 'updates item succcessfully' do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user, category: category)
    sign_in(user)

    click_on category.name

    click_on item.name

    click_on 'Update Item'

    fill_in "Name", with: "Super boots"

    click_on "Submit"

    expect(page).to have_content("Item updated.")
    expect(page).to have_content("Super boots")
  end

  scenario 'updates item unsucccessfully, with no name' do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user, category: category)
    sign_in(user)

    click_on category.name

    click_on item.name

    click_on 'Update Item'

    fill_in "Name", with: ""

    click_on "Submit"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Edit Item")
  end
end
