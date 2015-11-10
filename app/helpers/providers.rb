require 'provider'

module Providers

  TWITTER = Provider.new('twitter',
    'link-twitter',
    ->(sns_profile) { "https://twitter.com/#{sns_profile.nickname}" },
    ->(caption = nil) { "#{content_tag(:i, '', class: 'fa fa-twitter')} #{caption || ''}" },
    ->(caption, url) {
      text = "#{caption} #{url} via @BallGameHub"
      "https://twitter.com/intent/tweet?text=#{text}"
    }
  )

  def value_of(provider)
    case provider
    when "twitter"
      TWITTER
    else
      nil
    end
  end

  module_function :value_of
end
