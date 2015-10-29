class AttendancePlan < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  scope :of, -> (u, e) { where('user_id = ? and event_id = ?', u, e) }

  validates :user_id, presence: true
  validates :event_id, presence: true
end
