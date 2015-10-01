class User < ActiveRecord::Base
  has_many :items
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable, :confirmable, :lockable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable

  mount_uploader :profile_photo, ProfilePhotoUploader

  def admin?
    role == "admin"
  end

  def errors_for(model, attribute)
    if model.errors[attribute].present?
      content_tag :span, :class => 'error_explanation' do
        model.errors[attribute].join(", ")
      end
    end
  end
end
