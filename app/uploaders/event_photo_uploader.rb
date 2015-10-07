# encoding: utf-8

class EventPhotoUploader < AbstractBghUploader

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
