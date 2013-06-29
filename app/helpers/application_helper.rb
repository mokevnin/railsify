module ApplicationHelper
  include CustomUrlHelper

  def ham(model, attribute)
    model.to_s.classify.constantize.human_attribute_name(attribute)
  end

  def item(tag, name, path, link_options = {}, &block)
    options = {}
    options[:class] = :active if current_page?(path)
    link = link_to(name, path, link_options)
    content_tag(tag, link, options)
  end
end
