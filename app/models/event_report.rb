class EventReport < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :event_photo

  validates :user, presence: true
  validates :event, presence: true
end
