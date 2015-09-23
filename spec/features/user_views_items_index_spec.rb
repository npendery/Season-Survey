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
    user = FactoryGirl.create(:user)
    category1 = FactoryGirl.create(:category)
    category2 = FactoryGirl.create(:category, name: "cat 2")
    item1 = FactoryGirl.create(:item, user: user, category: category1)
    item2 = FactoryGirl.create(:item, user: user, category: category2)

    visit root_path

    click_on category1.name
    expect(page).to have_content(item1.name)
    expect(page).to_not have_content(item2.name)
  end
end
