class User < ActiveRecord::Base
  devise :omniauthable, omniauth_providers: [:twitter]

  mount_uploader :user_image, UserImageUploader
  belongs_to :color_theme
  has_many :attendance_plan
  has_many :sns_profile
  has_many :events, through: :attendance_plan

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates :name, presence: true
end
