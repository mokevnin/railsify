module ApplicationHelper
  include Concerns::CustomUrlHelper

  def han(model, attribute)
    model.to_s.classify.constantize.human_attribute_name(attribute)
  end

  def item(tag, name, path, link_options = {}, &block)
    options = {}
    options[:class] = :active if current_page?(path)
    link = link_to(name, path, link_options)
    content_tag(:li, link, options)
  end

  def default_search_form_options(options = {})
    {method: 'get', html: {class: 'form-inline'}, defaults: {label: false, required: false}}.merge(options)
  end

  def dict(model)
    model.to_s.classify.constantize.all
  end
end
