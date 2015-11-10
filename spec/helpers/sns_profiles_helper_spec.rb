require 'rails_helper'

RSpec.describe SnsProfilesHelper, type: :helper do
  describe 'twitter profile' do
    it "generates correct link" do
      profile = SnsProfile.new(provider: 'twitter', nickname: 'mura_mi', uid: '334')
      expect(link(profile)).to eq "https://twitter.com/mura_mi"
    end
  end
end
