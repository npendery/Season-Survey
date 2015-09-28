class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :category
  has_many :reviews

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :user, presence: true

  def self.search(search)
    where('name ILIKE ?', "%#{search}%")
  end
end
