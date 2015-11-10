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

  def prefix_sign_up(obj)
    content_tag(:i, '', class: 'fa fa-user-plus') + ' ' + obj
  end

  def prefix_sign_in(obj)
    content_tag(:i, '', class: 'fa fa-sign-in') + ' ' + obj
  end

  def prefix_sign_out(obj)
    content_tag(:i, '', class: 'fa fa-sign-out') + ' ' + obj
  end

  def prefix_edit(obj)
    content_tag(:i, '', class: 'fa fa-edit') + ' ' + obj
  end

  def prefix_email(obj)
    content_tag(:i, '', class: 'fa fa-envelope') + ' ' + obj
  end

  def prefix_twitter(obj)
    content_tag(:i, '', class: 'fa fa-twitter') + ' ' + (obj || 'Sign up with Twitter')
  end

  def twitter_link(obj)
    link_to user_omniauth_authorize_path(:twitter) do
      prefix_twitter obj
    end
  end

  def twitter_button(button_name = nil)
    button_to user_omniauth_authorize_path(:twitter), class: 'btn btn-twitter' do
      prefix_twitter button_name
    end
  end
end
