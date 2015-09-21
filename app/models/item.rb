class Item < ActiveRecord::Base
  belongs_to :user

  validates :name, uniqueness: true, presence: true
  validates :image, :category_id, :description, :price_range_id, presence: true
end
