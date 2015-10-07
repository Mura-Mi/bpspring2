# encoding: utf-8

class AbstractBghUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  process :fix_rotate

  def fix_rotate
    manipulate! do |img|
      img.auto_orient
      img
    end
  end


end
