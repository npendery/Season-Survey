class Item < ActiveRecord::Base
  belongs_to :user

  validates :name, uniqueness: true, presence: true
  validates :image, presence: true
  validates :category_id, presence: true
  validates :description, presence: true
  validates :price_range_id, presence: true
end
