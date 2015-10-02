require 'rails_helper'

feature 'user views item show page', %{
  As a user
  I want to visit the item show page
  So that I can see details and reviews about a selected item
} do

  # Acceptance Criteria:
  # User must see name, description of item
  # User must see all reviews of that item

  scenario 'user visits item show path' do
    review = FactoryGirl.create(:review)

    visit item_path(review.item)
    expect(page).to have_content(review.item.name)

    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.description)

    expect(page).to have_content("Add Review")
  end
end
