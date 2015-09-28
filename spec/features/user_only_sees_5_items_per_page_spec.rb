require 'rails_helper'

feature 'user sees only 5 items per page', %{
  As a signed up user
  I want to see only 5 existing items per page
  So that each page does not need to load all items
} do

  scenario 'views category first page with the most recent items' do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item1 = FactoryGirl.create(:item, user: user, category: category)
    sleep 0.1
    item2 = FactoryGirl.create(:item, user: user, category: category)
    sleep 0.1
    item3 = FactoryGirl.create(:item, user: user, category: category)
    sleep 0.1
    item4 = FactoryGirl.create(:item, user: user, category: category)
    sleep 0.1
    item5 = FactoryGirl.create(:item, user: user, category: category)
    sleep 0.1
    item6 = FactoryGirl.create(:item, user: user, category: category)
    sleep 0.1
    item7 = FactoryGirl.create(:item, user: user, category: category)
    sign_in(user)

    click_on category.name
    expect(page).to have_content(item7.name)
    expect(page).to_not have_content(item1.name)
  end

  scenario 'views category second page with items after the first 5' do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item1 = FactoryGirl.create(:item, user: user, category: category)
    sleep 0.1
    item2 = FactoryGirl.create(:item, user: user, category: category)
    sleep 0.1
    item3 = FactoryGirl.create(:item, user: user, category: category)
    sleep 0.1
    item4 = FactoryGirl.create(:item, user: user, category: category)
    sleep 0.1
    item5 = FactoryGirl.create(:item, user: user, category: category)
    sleep 0.1
    item6 = FactoryGirl.create(:item, user: user, category: category)
    sleep 0.1
    item7 = FactoryGirl.create(:item, user: user, category: category)
    sign_in(user)

    click_on category.name

    click_on "Next"

    expect(page).to have_content(item1.name)
    expect(page).to_not have_content(item7.name)
  end
end
