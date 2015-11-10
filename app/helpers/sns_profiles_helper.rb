module SnsProfilesHelper
  def profile_link_button(sns_profile)
    provider = sns_profile.provider_type
    divClass = "sns-link #{provider.button_class}"

    link_to provider.profile_link(sns_profile), class: divClass, target: '_blank' do
      content_tag :div, caption(sns_profile)
    end
  end

  def share_link_button(provider)
    divClass = "sns-link #{provider.button_class}"

    link_to provider.share_link_url, class: divClass, target: '_blank' do
      content_tag :div, caption(sns_profile)
    end
  end

  def link_to_url(provider, caption, url)
    divClass = "sns-link #{provider.button_class}"

    link_to provider.share_link(caption, url), class: divClass, target: '_blank' do
      content_tag :div, prefix(provider, 'Share Article')
    end
  end

  def caption(sns_profile)
    prefix(sns_profile.provider_type)
  end

  def prefix(provider, text = nil)
    case provider
    when Providers::TWITTER
      prefix_twitter(text || 'Twitter')
    end
  end

end
