class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :rating, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
end
