module ApplicationHelper
  def nil_to_no_image(img_url)
    img_url || asset_path('no_image.png')
  end

  def date_format(date)
    date.strftime('%-d %B, %Y')
  end

  def errors(model, attribute)
    return '' unless model && model.errors
    messages = model.errors[attribute].collect do |msg|
      content_tag :label, class: 'text-danger bgh-error-msg' do
        content_tag(:i, '', class: 'fa fa-remove') + msg
      end
    end

    messages.join.html_safe
  end
end
