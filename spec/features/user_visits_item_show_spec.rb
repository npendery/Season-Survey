require 'rails_helper'

feature 'user views item show page', %{
  As a user
  I want to visit the item show page
  So that I can see details and reviews about a selected item
} do

  # Acceptance Criteria:
  # User must see name, description of item
  # User must see all reviews of that item
  # User must be able to add a new review for that item
  # User must be able to delete only their own item

  scenario 'user visits item show path' do
    review = FactoryGirl.create(:review)

    visit item_path(review.item)
    expect(page).to have_content(review.item.name)
    expect(page).to have_content(review.item.description)

    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.description)

    expect(page).to have_content("Add Review")
    expect(page).to have_content("Back")
  end

  scenario 'user deletes review' do
    review = FactoryGirl.create(:review)

    sign_in(review.user)
    visit item_path(review.item)
    click_on "Delete"
    expect(page).to_not have_content(review)
  end

  scenario 'user cannot delete somebody else\' review' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: user1)

    sign_in(user2)
    visit item_path(review.item)
    expect(page).to_not have_content("Edit or Delete")
  end
end
