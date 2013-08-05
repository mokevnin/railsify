class StateEventInput < SimpleForm::Inputs::CollectionSelectInput
  def input
    @clean_attribute_name = attribute_name.to_s.gsub '_event', ''
    name_for_human = "human_#{@clean_attribute_name}_name"

    current_state = template.content_tag(:div, template.content_tag(:span, "Current state: #{object.send name_for_human}", :class => "label label-info")  )

    out = @builder.collection_select(
      attribute_name, object.send("#{@clean_attribute_name}_transitions"), :event, :human_event,
      input_options, input_html_options
    )
    (out << current_state).html_safe
  end
end
