module SnsProfilesHelper
  def profile_link_button(sns_profile)
    divClass = "sns-link #{button_class(sns_profile)}"

    link_to link(sns_profile), class: divClass, target: '_blank' do
      content_tag :div, caption(sns_profile)
    end
  end

  def button_class(sns_profile)
    case sns_profile.provider_type
    when Providers::TWITTER
      'link-twitter'
    end
  end

  def link(sns_profile)
    case sns_profile.provider_type
    when Providers::TWITTER
      "https://twitter.com/#{sns_profile.nickname}"
    end
  end

  def caption(sns_profile)
    case sns_profile.provider_type
    when Providers::TWITTER
      prefix_twitter('Twitter')
    end
  end
end
