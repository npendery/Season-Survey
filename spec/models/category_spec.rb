require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_valid(:name).when('Boots') }
  it { should_not have_valid(:name).when('', nil) }

  context 'uniqueness' do
    let!(:category) { FactoryGirl.create(:category) }
    let!(:dupe_category) { FactoryGirl.create(:category) }

    it 'requires a unique name' do
      dupe_category.name = category.name
      expect(dupe_category).to_not be_valid
      expect(dupe_category.errors[:name]).to_not be_empty
    end
  end
end
