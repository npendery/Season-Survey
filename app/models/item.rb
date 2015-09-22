class Item < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, uniqueness: true, presence: true
  validates :image, presence: true
  validates :description, presence: true
end
