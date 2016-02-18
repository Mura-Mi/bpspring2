require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do

    before do
      Event.destroy_all
    end

    after do
      Event.destroy_all
    end

    it "returns all events without param" do
      e1 = create(:event)
      e2 = create(:event)
      e3 = create(:event)

      get '/events', search: nil, format: 'json'

      expect(response).to be_success
      expect(response.body).to have_json_size(3)

      res = parse_json(response.body)
    end

  it "returns name matched events with search param" do
      e1 = create(:event, {name: 'Baystars vs Giants', event_date: Date.new(2013, 5, 10)})
      e2 = create(:event, {name: 'Swallows vs Carp'})
      e3 = create(:event, {name: 'Dragons vs Baystars', event_date: Date.new(2013, 5, 12)})

      get '/events', search: 'Bay', format: 'json'

      expect(response).to be_success
      expect(response.body).to have_json_size(2)

      events = parse_json(response.body)

      expect(events[0]['name']).to eq('Dragons vs Baystars (12 May, 2013)')
      expect(events[1]['name']).to eq('Baystars vs Giants (10 May, 2013)')
    end

  end
end
