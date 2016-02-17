class EventReportSerializer < ActiveModel::Serializer
  attributes :id,
    :summary,
    :comment,
    :event_photos,
    :url,
    :user,
    :author_url,
    :event_summary

  def event_summary
    object.event.summary
  end

  def url
    event_report_url(object, only_path: true)
  end

  def author_url
    user_url(object.user, only_path: true)
  end

end
