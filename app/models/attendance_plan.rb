class AttendancePlan < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
end
