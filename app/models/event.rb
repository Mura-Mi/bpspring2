class Event < ActiveRecord::Base
  belongs_to :place
  has_many :event_report

  validate :abbrevation_shorter_than_name

  private
  def abbrevation_shorter_than_name
    msg = 'Abbreviation must be shorter than name'
    errors.add(:abbreviation, msg) if name && abbreviation && abbreviation.length > name.length
  end
end
