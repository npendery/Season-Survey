class Review < ActiveRecord::Base
  RATINGS = [1, 2, 3, 4, 5]

  belongs_to :user
  belongs_to :item
  has_many :votes

  validates :rating, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true

  def self.search(search)
    where('description ILIKE ?', "%#{search}%")
  end

  def total_score
    score = 0
    votes.each do |a|
      score += a.vote
    end
    score
  end
end
