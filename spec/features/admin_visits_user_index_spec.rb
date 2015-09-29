require 'rails_helper'

feature 'admin visits users index', %{
  As an admin
  I want to visit the users index
  So that I can see and modify all users
} do

  # Acceptance Criteria:
  # * Admin must see list of all users
  # * Visitor must not see the page
  # * Admin can delete users
  # * Admin can change 'member' to 'admin'

  scenario 'admin visits users index' do
    user1 = FactoryGirl.create(:user, role: 'admin')
    user2 = FactoryGirl.create(:user)
    sign_in(user1)
    visit users_path

    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)
    expect(page).to have_content("Delete This User")
    expect(page).to have_content("Make Admin")
  end

  scenario 'member fails to visit users index' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    expect{visit users_path}.to raise_error(ActionController::RoutingError)
  end

  scenario 'admin deletes user' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, role: 'admin')

    sign_in(user2)
    visit users_path

    expect(page).to have_content(user2.username)

    within (".member-list") do
      click_link "Delete This User"
    end

    expect(page).to_not have_content(user1.username)
  end

  scenario 'admin makes another user an admin' do
    user1 = FactoryGirl.create(:user, username: 'bob')
    user2 = FactoryGirl.create(:user, role: 'admin')

    sign_in(user2)
    visit users_path

    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)

    within (".member-list") do
      click_link "Make Admin"
    end

    within (".admin-list") do
      expect(page).to have_content(user1.username)
    end
  end
end
