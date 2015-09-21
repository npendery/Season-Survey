class User < ActiveRecord::Base
  has_many :items
  has_many :reviews
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable,
        :validatable, :confirmable, :lockable
end
