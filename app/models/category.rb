class Category < ActiveRecord::Base
  has_many :items

  validates :name, presence: true, uniqueness: true

  def name_for_select
    name.capitalize
  end
end
