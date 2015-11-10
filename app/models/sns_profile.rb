class SnsProfile < ActiveRecord::Base
  belongs_to :user

  validates :provider, presence: :true
  validates :uid, presence: :true
  validates :nickname, presence: :true

  def provider_type
    Providers.value_of(provider)
  end
end
