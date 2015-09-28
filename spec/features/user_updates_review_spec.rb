require 'rails_helper'

feature 'user updates review', %{
  As a user
  I want to update a review
  So that I can correct details
} do

  # Acceptance Criteria:
  # User must be logged in
  # User can only edit his/her own review

  scenario 'user wants to edit his/her review' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    item = FactoryGirl.create(:item, user: user, category: category)
    review = FactoryGirl.create(:review, user: user, item: item)

    sign_in(item.user)
    visit item_path(item)
    click_on "Edit"
    choose 3
    click_on "Submit Edits"

    expect(page).to have_content(3)
    expect(page).to have_content(review.description)
  end

  scenario 'user tries to edit somebody else\'s review' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    item = FactoryGirl.create(:item, user: user1, category: category)

    sign_in(user2)
    visit item_path(item)
    expect(page).to_not have_content("Edit")
  end
end
