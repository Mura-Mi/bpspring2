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

  def twitter_link(obj)
    link_to(obj, user_omniauth_authorize_path(:twitter), style: 'display: inline-block;')
  end

  def twitter_button(button_name = nil)
    button_to user_omniauth_authorize_path(:twitter), class: 'btn btn-twitter' do
      content_tag(:i, '', class: 'fa fa-twitter') + ' ' + (button_name || "Sign in with Twitter")
    end
  end
end
