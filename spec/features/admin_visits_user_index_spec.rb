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
    user = FactoryGirl.create(:user, role: 'admin')
    sign_in(user)
    visit users_path

    expect(page).to have_content(user.username)
    expect(page).to have_content("Delete This User")
    expect(page).to have_content("Make Admin")
  end

  scenario 'member visits users index' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    expect{visit users_path}.to raise_error(ActionController::RoutingError)
  end

  scenario 'admin deletes user' do
    user1 = FactoryGirl.create(:user, role: 'admin')
    user2 = FactoryGirl.create(:user)

    sign_in(user1)
    visit users_path

    expect(page).to have_content(user2.username)

    click_on "Delete This User"

    expect(page).to_not have_content(user2.username)
  end

  scenario 'admin makes another user an admin' do
  end
end
