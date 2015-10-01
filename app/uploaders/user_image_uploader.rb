# encoding: utf-8

require 'mini_magick'

class UserImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  process :fix_rotate

  def fix_rotate
    manipulate! do |img|
      img.auto_orient
      img
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
