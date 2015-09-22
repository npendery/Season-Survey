require 'rails_helper'

feature 'user registers', %{
  As a visitor
  I want to visit the home page
  So that I can see a list of categories
} do

  # Acceptance Criteria:
  # * Visitor must see link to sign in
  # * Visitor must see a list of categories that are links to other pages

	scenario 'user visits root path' do
    item = FactoryGirl.create(:item)
    category = FactoryGirl.create(:category)

    visit root_path
    expect(page).to have_content("Sign In")
    expect(page).to have_content(category.name)
    expect(page).to_not have_content(item.purchase_url)
	end
end
