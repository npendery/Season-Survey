require 'rails_helper'

feature 'user updates item', %{
  As a signed up user
  I want to update an existing item
  So that other users can rate and review it
} do

  before do
    FactoryGirl.create(:category)
  end

  scenario 'updates item succcessfully' do
    user = FactoryGirl.create(:user)
    # item = FactoryGirl.create(:item)
    sign_in(user)

    click_on 'Create Item'

    fill_in "Name", with: "Boots"
    fill_in "Description", with: "Theyre....boots"
    fill_in "Where to Purchase", with: "The zoo on Sesame St."
    fill_in "Image URL", with: "http://www.imgur.com/d383ncZ"
    select "Fashion", from: 'Category'

    click_on "Submit"

    click_on 'Update Item'

    fill_in "Name", with: "Bobs boots"

    click_on "Submit"
    expect(page).to have_content("Item updated.")
    expect(page).to have_content("Bobs boots")
  end

  scenario 'updates item unsucccessfully, with no name' do
    user = FactoryGirl.create(:user)
    # item = FactoryGirl.create(:item)
    sign_in(user)

    click_on 'Create Item'

    fill_in "Name", with: "Boots"
    fill_in "Description", with: "Theyre....boots"
    fill_in "Where to Purchase", with: "The zoo on Sesame St."
    fill_in "Image URL", with: "http://www.imgur.com/d383ncZ"
    select "Fashion", from: 'Category'

    click_on "Submit"

    click_on 'Update Item'

    fill_in "Name", with: ""

    click_on "Submit"
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Edit Item")
  end
end
