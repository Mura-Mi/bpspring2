class Provider

  attr_reader :name, :button_class

  def initialize(name, button_class, link_template, caption_template)
    @name = name
    @button_class = button_class
    @link_template = link_template
    @caption_template = caption_template
  end

  def profile_link(sns_profile)
    @link_template.call(sns_profile)
  end

  def caption(text = nil)
    @caption_template.call(text)
  end

  def share_link(url)
  end

end
