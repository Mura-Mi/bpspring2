module ApplicationHelper
  def nil_to_no_image(img_url)
    img_url || asset_path('no_image.png')
  end
end
