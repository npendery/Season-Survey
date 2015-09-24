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

  scenario 'user visits item show path' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    item = FactoryGirl.create(:item, user: user, category: category)
    review = FactoryGirl.create(:review, user: user, item: item)

    visit item_path(item)
    expect(page).to have_content(item.name)
    expect(page).to have_content(item.description)

    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.description)

    expect(page).to have_content("Add Review")
    expect(page).to have_content("Back")
  end
end
