# encoding: utf-8

require 'mini_magick'

class UserImageUploader < AbstractBghUploader

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
