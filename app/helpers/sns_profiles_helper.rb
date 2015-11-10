module SnsProfilesHelper
  def profile_link_button(sns_profile)
    type = sns_profile.provider_type
    divClass = "sns-link #{type.button_class}"

    link_to type.profile_link(sns_profile), class: divClass, target: '_blank' do
      content_tag :div, caption(sns_profile)
    end
  end

  def caption(sns_profile)
    case sns_profile.provider_type
    when Providers::TWITTER
      prefix_twitter('Twitter')
    end
  end


end
