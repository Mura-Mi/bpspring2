require 'date'

FactoryGirl.define do
  factory :event do
    name "Sample Event"
    abbreviation "Sample"
    event_date Date.new(2014, 8, 9)
    comment "bla bla bla"
    place_id 1
  end
end
