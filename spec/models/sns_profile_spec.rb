require 'rails_helper'

RSpec.describe SnsProfile, type: :model do
  describe "validation" do
    it "does not allow blank for provider, nickname, uid" do
      profile = SnsProfile.new
      expect(profile.valid?).to be_falsey
      expect(profile.errors[:provider]).to be_present
      expect(profile.errors[:nickname]).to be_present
      expect(profile.errors[:uid]).to be_present
    end
  end

  describe 'provider_type' do
    it "twitter profile returns TWITTER" do
      profile = SnsProfile.new(provider: 'twitter', nickname: 'null', uid: '666')
      expect(profile.provider_type).to eq Providers::TWITTER
    end
  end
end
