class EventReportSerializer < ActiveModel::Serializer
  attributes :id,
    :summary,
    :comment,
    :digest_photo,
    :url,
    :user,
    :author_url,
    :event_summary

  def digest_photo
    if object.event_photos.blank?
      scope.image_url('no_image.png')
    else
      object.event_photos[0].photo.mini.url
    end

  end

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
