require 'rails_helper'

feature 'user votes review on item show page', %{
  As a user
  I want to vote on a review of an item
  So that I can see what others think about the review
} do

  # Acceptance Criteria:
  # User must see upvote, downvote, and total votes
  # Vote total must change when upvote or downvote are selected
  # Users vote will reset when reclicking the same vote
  # Vote total will tally when multiple people vote

  scenario 'user upvotes on review', js: true do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user, category: category)
    review = FactoryGirl.create(:review, item: item)
    sign_in(user)

    visit item_path(item)
    expect(page).to have_content(review.description)
    expect(page).to have_content("Votes: 0")

    find("img[alt='Pdjs3zv']").click

    expect(page).to have_content("Votes: 1")
  end

  scenario 'user downvotes on review', js: true do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user, category: category)
    review = FactoryGirl.create(:review, item: item)
    sign_in(user)

    visit item_path(item)
    expect(page).to have_content(review.description)
    expect(page).to have_content("Votes: 0")

    find("img[alt='Eqld2']").click

    expect(page).to have_content("Votes: -1")
  end

  scenario 'user votes the same vote on review twice', js: true do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user, category: category)
    review = FactoryGirl.create(:review, item: item)
    sign_in(user)

    visit item_path(item)
    expect(page).to have_content(review.description)
    expect(page).to have_content("Votes: 0")

    find("img[alt='Eqld2']").click

    expect(page).to have_content("Votes: -1")

    find("img[alt='Eqld2']").click

    expect(page).to have_content("Votes: 0")
  end

  scenario 'user changes vote on review', js: true do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user, category: category)
    review = FactoryGirl.create(:review, item: item)
    sign_in(user)

    visit item_path(item)
    expect(page).to have_content(review.description)
    expect(page).to have_content("Votes: 0")

    find("img[alt='Eqld2']").click

    expect(page).to have_content("Votes: -1")

    find("img[alt='Pdjs3zv']").click

    expect(page).to have_content("Votes: 1")
  end

  scenario 'multiple users vote on review', js: true do
    category = FactoryGirl.create(:category)
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user1, category: category)
    review = FactoryGirl.create(:review, item: item)

    sign_in(user1)
    visit item_path(item)
    expect(page).to have_content(review.description)
    expect(page).to have_content("Votes: 0")
    find("img[alt='Eqld2']").click
    expect(page).to have_content("Votes: -1")

    click_on "Sign Out"

    sign_in(user2)
    visit item_path(item)
    expect(page).to have_content("Votes: -1")
    find("img[alt='Eqld2']").click
    expect(page).to have_content("Votes: -2")
  end
end
