require 'rails_helper'

feature 'user sees only 5 items per page', %{
  As a signed up user
  I want to see only 5 existing items per page
  So that each page does not need to load all items
} do

  scenario 'views category first page with the most recent items' do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item_list = FactoryGirl.create_list(:item, 7, user: user, category: category)

    sign_in(user)

    click_on category.name

    expect(page).to have_content(item_list[6].name)
    expect(page).to have_content(item_list[5].name)
    expect(page).to have_content(item_list[4].name)
    expect(page).to have_content(item_list[3].name)
    expect(page).to have_content(item_list[2].name)
    expect(page).to_not have_content(item_list[1].name)
    expect(page).to_not have_content(item_list[0].name)
  end

  scenario 'views category second page with items after the first 5' do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item_list = FactoryGirl.create_list(:item, 7, user: user, category: category)

    sign_in(user)

    click_on category.name

    click_on "Next"

    expect(page).to have_content(item_list[1].name)
    expect(page).to have_content(item_list[0].name)
    expect(page).to_not have_content(item_list[6].name)
    expect(page).to_not have_content(item_list[5].name)
    expect(page).to_not have_content(item_list[4].name)
    expect(page).to_not have_content(item_list[3].name)
    expect(page).to_not have_content(item_list[2].name)
  end
end
