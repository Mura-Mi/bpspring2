require 'provider'

module Providers

  TWITTER = Provider.new('twitter',
    'btn-twitter',
    ->(sns_profile) { "https://twitter.com/#{sns_profile.nickname}" },
    ->(caption = nil) { "#{content_tag(:i, '', class: 'fa fa-twitter')} #{caption || ''}" },
    ->(caption, url) {
      text = "#{caption} #{url} via @BallGameHub"
      "https://twitter.com/intent/tweet?text=#{text}"
    }
  )
  FACEBOOK = Provider.new('facebook',
    'btn-facebook',
    ->(sns_profile) { "https://facebook.com/#{sns_profile.nickname}" },
    ->(caption = nil) { "#{content_tag(:i, '', class: 'fa fa-facebook')} #{caption || ''}" },
    ->(caption, url) {
      text = "#{caption} #{url} via @BallGameHub"
      "https://twitter.com/intent/tweet?text=#{text}"
    }
  )

  def value_of(provider)
    case provider
    when "twitter"
      TWITTER
    when "facebook"
      FACEBOOK
    else
      nil
    end
  end

  module_function :value_of
end
