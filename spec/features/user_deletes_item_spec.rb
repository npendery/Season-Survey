require 'rails_helper'

feature 'user deletes item', %{
  As a signed up user
  I want to delete an existing item
  So that other users cant see it anymore
} do

  scenario 'member deletes their own item succcessfully' do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user, category: category)
    sign_in(user)

    click_on category.name

    click_on item.name

    click_on 'Delete Item'

    expect(page).to have_content("Item deleted.")
    expect(page).to have_content(category.name)
  end

  scenario 'member cannot delete another user\'s item' do
    category = FactoryGirl.create(:category)
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user2, category: category)
    sign_in(user1)

    click_on category.name

    click_on item.name

    expect(page).to_not have_content("Delete")
  end

  scenario 'admin can delete somebody else\' item' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, role: 'admin')
    review = FactoryGirl.create(:review, user: user1)

    sign_in(user2)
    visit item_path(review.item)
    expect(page).to have_content("Delete Item")
    click_on "Delete Item"
    expect(page).to_not have_content(review.item.name)
  end
end
