require 'rails_helper'

RSpec.describe Item, type: :model do

  # it { should belong_to :category }
  # it { should belong_to :price_range }

  it { should have_valid(:name).when('Item Name', 'Moon Boots') }
  it { should_not have_valid(:name).when('', nil) }

  it { should have_valid(:image).when('http://www.gettyimages.jpg') }
  it { should_not have_valid(:image).when('', nil) }

  it { should have_valid(:description).when('this is really cool stuff') }
  it { should_not have_valid(:description).when('', nil) }

  # it { should have_valid(:price_range).when('$50 to $100') }
  # it { should_not have_valid(:price_range).when('', nil) }
  #
  # it { should have_valid(:category).when('Accessories') }
  # it { should_not have_valid(:category).when('', nil) }

  context 'uniqueness' do
    let!(:item) { FactoryGirl.create(:item) }
    let!(:dupe_item) { FactoryGirl.create(:item) }

    it 'requires a unique name' do
      dupe_item.name = item.name
      expect(dupe_item).to_not be_valid
      expect(dupe_item.errors[:name]).to_not be_empty
    end
  end
end
