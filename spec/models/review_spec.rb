require 'rails_helper'

RSpec.describe Review, type: :model do

  it { should belong_to :user }
  it { should belong_to :item }

  it { should have_valid(:rating).when(5) }
  it { should_not have_valid(:rating).when('', nil) }

  it { should have_valid(:description).when('this is really cool stuff') }
  it { should_not have_valid(:description).when('', nil) }

  describe "#total_score" do
    it "it sums the score for each vote" do
      review = FactoryGirl.create(:review)
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      vote1 = FactoryGirl.create(:vote, user: user1, review: review)
      vote2 = FactoryGirl.create(:vote, user: user2, review: review)

      expect(review.total_score).to eq(2)
    end
  end
end
