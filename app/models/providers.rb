require 'provider'

module Providers

  TWITTER = Provider.new('twitter',
    'link-twitter',
    ->(sns_profile) { "https://twitter.com/#{sns_profile.nickname}" }
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
