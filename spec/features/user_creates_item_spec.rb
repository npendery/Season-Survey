require 'rails_helper'

feature 'user creates item', %{
  As a signed up user
  I want to create new item
  So that other users can rate and review it
} do

  before do
    FactoryGirl.create(:category)
  end

  scenario 'creates item succcessfully' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Item'

    fill_in "Name", with: "Fuzzy wuzzy snuffaluffagus"
    fill_in "Description", with: "It's big, and hairy"
    fill_in "Where to Purchase", with: "The zoo on Sesame St."
    fill_in "Image URL", with: "http://www.imgur.com/d383ncZ"
    select "Fashion", from: "Category"

    click_on "Submit"

    expect(page).to have_content("Item added.")
    expect(page).to have_content("It's big, and hairy")
  end

  scenario 'create unsucccessful item, without name' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Item'

    fill_in "Name", with: ""
    fill_in "Description", with: "It's big, and hairy"
    fill_in "Where to Purchase", with: "The zoo on Sesame St."
    fill_in "Image URL", with: "http://www.imgur.com/d383ncZ"
    select "Fashion", from: 'Category'

    click_on "Submit"
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'user forgets description field' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Item'

    fill_in "Name", with: "Fuzzy wuzzy snuffaluffagus"
    fill_in "Description", with: ""
    fill_in "Where to Purchase", with: "The zoo on Sesame St."
    fill_in "Image URL", with: "http://www.imgur.com/d383ncZ"
    select "Fashion", from: 'Category'

    click_on "Submit"

    expect(page).to have_content("Description can't be blank")
  end
end
