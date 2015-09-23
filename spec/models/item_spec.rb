require 'rails_helper'

RSpec.describe Item, type: :model do

  it { should have_valid(:name).when('Item Name', 'Moon Boots') }
  it { should_not have_valid(:name).when('', nil) }

  it { should have_valid(:image).when('http://www.gettyimages.jpg') }
  it { should_not have_valid(:image).when('', nil) }

  it { should have_valid(:description).when('this is really cool stuff') }
  it { should_not have_valid(:description).when('', nil) }

  context 'uniqueness' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:category) { FactoryGirl.create(:category) }
    let!(:item) { Item.create!(name: "Snow boots", description: "Fluffy", image: "www.zappos.com", purchase_url: "www.zappos.com", user_id: user.id, category_id: category.id) }
    let!(:dupe_item) { Item.create!(name: "New Snow boots", description: "Fluffy", image: "www.zappos.com", purchase_url: "www.zappos.com", user_id: user.id, category_id: category.id) }

    it 'requires a unique name' do
      dupe_item.name = item.name
      expect(dupe_item).to_not be_valid
      expect(dupe_item.errors[:name]).to_not be_empty
    end
  end
end
