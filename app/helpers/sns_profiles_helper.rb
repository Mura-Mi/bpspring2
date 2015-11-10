module SnsProfilesHelper
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
