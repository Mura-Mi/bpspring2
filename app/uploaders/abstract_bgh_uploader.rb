# encoding: utf-8

class AbstractBghUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def self.set_storage
    if Rails.application.config.use_aws
      :fog
    else
      :file
    end
  end

  storage set_storage

  process :fix_rotate

  def fix_rotate
    manipulate! do |img|
      img.auto_orient
      img
    end
  end

  version :mini do
    process resize_to_fill: [400, -1]
  end

end
