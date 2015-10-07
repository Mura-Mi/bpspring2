FactoryGirl.define do
  factory :event_report do
    association :user, factory: :user
    association :event, factory: :event
    comment "MyText"
    summary "Summary"
  end

end
