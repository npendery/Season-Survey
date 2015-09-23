require 'rails_helper'

feature 'user visits items index', %{
  As a visitor
  I want to visit the items index
  So that I can see items specific to a particular category
} do

  # Acceptance Criteria:
  # * Visitor must see list of relevant items
  # * Visitor must not see items of another category

  scenario 'user visits root path' do
    item1 = FactoryGirl.create(:item, category_id: 1)
    item2 = FactoryGirl.create(:item, category_id: 2)
    category = FactoryGirl.create(:category, id: 1)

    visit root_path
    click_on category.name
    expect(page).to have_content(item1.name)
    expect(page).to_not have_content(item2.name)
  end
end
