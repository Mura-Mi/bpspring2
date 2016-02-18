class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_date, :name

  def name
    object.format
  end
end
