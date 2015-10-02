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

  paginates_per 5
  max_paginates_per 100

  def self.search(search)
    where('name ILIKE ?', "%#{search}%") |
      where('description ILIKE ?', "%#{search}%")
  end

  def votes_order
    self.reviews.sort_by{ |review| review.total_score }.reverse!
  end
end
