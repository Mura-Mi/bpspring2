class User < ActiveRecord::Base
  mount_uploader :user_image, UserImageUploader
  belongs_to :color_theme
  has_many :attendance_plan
  has_many :events, through: :attendance_plan

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :name, uniqueness: true
end
