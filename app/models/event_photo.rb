class EventPhoto < ActiveRecord::Base
  include InterestSubject
  validates :title, length: {maximum: 50}
  validates :comment, length: {maximum: 600}
  validates :photo, presence: true

  belongs_to :event_report

  mount_uploader :photo, EventPhotoUploader
end
