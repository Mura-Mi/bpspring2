class Event < ActiveRecord::Base
  belongs_to :place
  has_many :event_report
  has_many :attendance_plan
  has_many :users, through: :attendance_plan

  validates :name, presence: true
  validates :event_date, presence: true
  validate :abbrevation_shorter_than_name

  scope :held_in, -> (place_id) { where('place_id = ?', place_id) }
  scope :recent, -> (count) {
    where('event_date < ?', Date.today).order(event_date: :desc).limit(count)
  }
  scope :upcoming, -> (count) {
    where('event_date >= ?', Date.today).order(:event_date).limit(count)
  }
  scope :name_match, -> (query) {
    q = "%#{query}%"
    where('name like ?', q)
  }

  public
  def offset_days
    event_date && (Date.today - event_date).abs
  end

  def format
    EventsHelper.oneline_summary self
  end

  def summary
    "%s (%s)" % [name, event_date.strftime('%d %B, %Y')]
  end

  private
  def abbrevation_shorter_than_name
    msg = 'Abbreviation must be shorter than name'
    errors.add(:abbreviation, msg) if name && abbreviation && abbreviation.length > name.length
  end
end
