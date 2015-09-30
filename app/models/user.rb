class User < ActiveRecord::Base
  mount_uploader :user_image, EventImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :name, uniqueness: true
end
