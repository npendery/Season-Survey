class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :rating, :description, :user_id, :item_id, presence: true
end
