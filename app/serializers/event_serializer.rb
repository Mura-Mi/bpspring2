class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_date
  attribute :format, key: :name
end
