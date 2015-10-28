require 'rails_helper'

RSpec.describe AttendancePlan, type: :model do
  describe "relation" do
    it "shows planning of attendance" do
      baystarsFan = create(:user)
      anotherFan = create(:user)
      bayEvent = create(:event)
      bayGame = create(:event)

      eventAttendancePlan = AttendancePlan.create({user: baystarsFan, event: bayEvent})
      gemeAttendancePlan = AttendancePlan.create({user: baystarsFan, event: bayGame})
      anotherFansPlan = AttendancePlan.create({user: anotherFan, event: bayGame});

      expect(baystarsFan.events).to have(2).items
      expect(baystarsFan.events).to include(bayEvent, bayGame)

      expect(bayGame.users).to have(2).items
      expect(bayGame.users).to include(baystarsFan, anotherFan)
    end
  end
end
