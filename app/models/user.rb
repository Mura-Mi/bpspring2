class User < ActiveRecord::Base
  mount_uploader :user_image, UserImageUploader
  belongs_to :color_theme
  has_many :attendance_plan
  has_many :sns_profile
  has_many :events, through: :attendance_plan
  has_many :event_reports

  devise :database_authenticatable
  devise :registerable
  devise :recoverable
  devise :rememberable
  devise :trackable
  devise :omniauthable, omniauth_providers: [:twitter, :facebook]
  devise :validatable

  def email_required?
    empty_sns_profile?
  end

  def password_required?
    empty_sns_profile? && super
  end

  def confirmed_by_password?
    empty_sns_profile? && encrypted_password.present?
  end

  def update_with_password(params, *options)
    if confirmed_by_password?
      super
    else
      params.delete(:current_password)
      update_attributes(params, *options)
    end
  end

  def empty_sns_profile?
    sns_profile.empty?
  end

  def posted_report_count
    event_reports.count
  end

  def sns_profile_of(provider)
    self.sns_profile.bsearch{ |x| x.provider == provider.to_s }
  end

  validates :name, presence: true
end
