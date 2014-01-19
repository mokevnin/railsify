class ChosenSelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input_html_classes
    super.push('chosen-select')
  end
  def input_html_options
    super.merge({ 'data-placeholder' => placeholder_text })
  end
end
