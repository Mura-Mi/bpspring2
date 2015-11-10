class Provider

  attr_reader :name, :button_class, :share_link_url

  def initialize(name, button_class, link_template, caption_template, \
    share_link_url)
    @name = name
    @button_class = button_class
    @link_template = link_template
    @caption_template = caption_template
    @share_link_url = share_link_url
  end

  def profile_link(sns_profile)
    @link_template.call(sns_profile)
  end

  def caption(text = nil)
    @caption_template.call(text)
  end

  def share_link(caption, url)
    @share_link_url.call(caption, url)
  end

end
