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
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    item = Item.create!(name: "Snow boots", description: "Fluffy", image: "www.zappos.com", purchase_url: "www.zappos.com", user_id: user.id, category_id: category.id)

    visit root_path
    expect(page).to have_content("Sign In")
    expect(page).to have_content(category.name)
    expect(page).to_not have_content(item.purchase_url)
  end
end
