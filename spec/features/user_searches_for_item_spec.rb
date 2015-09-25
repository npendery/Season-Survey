require 'rails_helper'

feature 'user searches for item', %{
  As a signed up user
  I want to search an existing item
  So that I can see if it exists
} do

  scenario 'searches for item in database' do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user, category: category)
    sign_in(user)

    fill_in "search", with: item.name

    click_on "Search"

    expect(page).to have_content("Search Results")
    expect(page).to have_content(item.name)
    expect(page).to_not have_content("No Results")
  end

  scenario 'searches for item not in database' do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user, category: category)
    sign_in(user)

    fill_in "search", with: "armadillo pizza"

    click_on "Search"

    expect(page).to have_content("Search Results")
    expect(page).to have_content("No Results")
  end
end
