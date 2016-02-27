FactoryGirl.define do
  factory :interest do
    association :from_id, factory: :user
    to_type "EventReport"
    to_id { EventReport.first.id }
    interest_type 'hit'
  end

end
