require "rails_helper"

feature "user adds profile pic" do
  scenario "adds profile pic succcessfully" do
	  user = FactoryGirl.create(:user)
		visit root_path

    click_on "Profile"

    attach_file "Profile Photo", "#{Rails.root}/spec/support/images/example_photo.jpg"
    click_on "Submit"

    user = User.last
    expect(page).to have_content("photo added")
    expect(page).to have_xpath("//img[@src=\"/uploads/user/profile_photo/#{user.id}/example_photo.jpg\"]")
    expect(user.profile_photo.file.filename).to eq("example_photo.jpg")
  end
end
