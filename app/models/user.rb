class User < ActiveRecord::Base
  has_many :items
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable,
        :validatable, :confirmable, :lockable
end
