class Review < ActiveRecord::Base
  RATINGS = [1, 2, 3, 4, 5]
  
  belongs_to :user
  belongs_to :item

  validates :rating, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
end
