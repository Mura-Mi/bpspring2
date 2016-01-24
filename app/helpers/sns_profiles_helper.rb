module SnsProfilesHelper
  def profile_link_button(sns_profile)
    provider = sns_profile.provider_type
    divClass = "btn #{provider.button_class} btn-account"

    button_to provider.profile_link(sns_profile), class: divClass, target: '_blank' do
      caption(sns_profile) # content_tag :div, caption(sns_profile)
    end
  end

  def share_link_button(provider)
    divClass = "btn sns-link #{provider.button_class}"

    button_to provider.share_link_url, class: divClass, target: '_blank' do
      caption(sns_profile) #content_tag :div, caption(sns_profile)
    end
  end

  def link_to_url(provider, caption, url)
    content_tag :div, class: 'sns-link-button' do
      button_to provider.share_link(caption, url), class: "btn #{provider.button_class}", target: '_blank' do
        prefix(provider, 'Share Article')
      end
    end
  end

  def caption(sns_profile)
    prefix(sns_profile.provider_type)
  end

  def prefix(provider, text = nil)
    case provider
    when Providers::TWITTER
      prefix_twitter(text || 'Twitter')
    when Providers::FACEBOOK
      prefix_facebook(text || 'Facebook')
    end
  end

end
