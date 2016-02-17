class EventReportSerializer < ActiveModel::Serializer
  attributes :id, :summary, :comment, :event_photos, :url

  def url
    event_report_url(object, only_path: true)
  end

end
