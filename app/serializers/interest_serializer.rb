class InterestSerializer < ActiveModel::Serializer
  attributes :id, :to_type, :to_id, :interest_type
  has_one :user
end
