class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :score, presence: true
  validates :score, numericality: { only_integer: true }
  validates :score, inclusion: { in: -1..1 }
  validates :user, presence: true
  validates :user, uniqueness: { scope: :review }
  validates :review, presence: true

end
