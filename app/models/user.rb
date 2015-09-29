class User < ActiveRecord::Base
  has_many :items
  has_many :upvotes
  has_many :downvotes
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable, :confirmable, :lockable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable

  def admin?
    role == "admin"
  end
end
