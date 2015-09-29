require 'rails_helper'

  feature 'user deletes review', %{
    As a signed up user
    I want to delete an existing review
    So that other users cant see it anymore
  } do

  scenario 'member deletes own review' do
    review = FactoryGirl.create(:review)

    sign_in(review.user)
    visit item_path(review.item)
    click_on "Delete"
    expect(page).to_not have_content(review)
  end

  scenario 'member cannot delete somebody else\' review' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: user1)

    sign_in(user2)
    visit item_path(review.item)
    expect(page).to_not have_content("Edit or Delete")
  end

  scenario 'admin can delete somebody else\' review' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, role: 'admin')
    review = FactoryGirl.create(:review, user: user1)

    sign_in(user2)
    visit item_path(review.item)
    expect(page).to have_content("Edit or Delete")
    click_on "Delete"
    expect(page).to_not have_content(review.description)
  end
end
