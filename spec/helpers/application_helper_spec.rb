require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "errors" do
    it "show error message with error" do
      e = Event.new
      e.valid?
      expect(errors(e, :name)).to match /can&#39;t be blank/
    end

    it "shows blank without errors" do
      e = Event.new(name: 'hoge')
      e.valid?
      expect(errors(e, :name)).to be_empty
    end

    it "shows blank with nil model" do
      expect(errors(nil, :name)).to be_empty
    end
  end
end
