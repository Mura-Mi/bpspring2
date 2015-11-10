module Providers
  TWITTER = 1

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
