require 'rails_helper'

feature 'user sees only 5 items per page', %{
  As a signed up user
  I want to see only 5 existing items per page
  So that each page does not need to load all items
} do

  scenario 'views category first page with the most recent items' do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item_li = FactoryGirl.create_list(:item, 7, user: user, category: category)

    sign_in(user)

    click_on category.name

    expect(page).to have_content(item_li[6].name)
    expect(page).to have_content(item_li[5].name)
    expect(page).to have_content(item_li[4].name)
    expect(page).to have_content(item_li[3].name)
    expect(page).to have_content(item_li[2].name)
    expect(page).to_not have_content(item_li[1].name)
    expect(page).to_not have_content(item_li[0].name)
  end

  scenario 'views category second page with items after the first 5' do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item_li = FactoryGirl.create_list(:item, 7, user: user, category: category)

    sign_in(user)

    click_on category.name

    click_on "Next"

    expect(page).to have_content(item_li[1].name)
    expect(page).to have_content(item_li[0].name)
    expect(page).to_not have_content(item_li[6].name)
    expect(page).to_not have_content(item_li[5].name)
    expect(page).to_not have_content(item_li[4].name)
    expect(page).to_not have_content(item_li[3].name)
    expect(page).to_not have_content(item_li[2].name)
  end
end
