class EventReport < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :event_photos

  validates :summary, presence: true
  validates :summary, length: {maximum: 30}
  validates :user, presence: true
  validates :event, presence: true

  accepts_nested_attributes_for :event_photos, allow_destroy: true
end
