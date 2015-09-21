require 'rails_helper'

RSpec.describe Review, type: :model do

  it { should belong_to :user }
  it { should belong_to :item }

  it { should have_valid(:rating).when(5) }
  it { should_not have_valid(:rating).when('', nil) }

  it { should have_valid(:description).when('this is really cool stuff') }
  it { should_not have_valid(:description).when('', nil) }
end
