class Interest < ActiveRecord::Base
  belongs_to :user, foreign_key: :from_id

  enum interest_type: { hit: 1, homerun: 4, plan_to_go: 5 }
end
