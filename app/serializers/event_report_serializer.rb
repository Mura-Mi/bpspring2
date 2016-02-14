class EventReportSerializer < ActiveModel::Serializer
  attributes :id, :summary, :comment, :event_photos
end
