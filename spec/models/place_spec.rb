require 'rails_helper'

RSpec.describe Place, type: :model do
  describe "scope" do
    describe "name_match" do
      it "filters by name" do
        hoge = create(:place, {name: 'hoge'})
        fuga = create(:place, {name: 'fuga'})
        mage = create(:place, {name: 'mage'})

        places = Place.name_match('ge')

        expect(places).to have(2).items
        expect(places).to include(hoge, mage)
      end
    end
  end
end
