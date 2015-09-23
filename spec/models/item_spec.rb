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
    let!(:item) { FactoryGirl.create(:item, user: user, category: category) }
    let!(:dupe_item) { FactoryGirl.create(:item, user: user, category: category) }

    it 'requires a unique name' do
      dupe_item.name = item.name
      expect(dupe_item).to_not be_valid
      expect(dupe_item.errors[:name]).to_not be_empty
    end
  end
end
